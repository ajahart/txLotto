class Name < ActiveRecord::Base
    require 'mechanize'

def self.importSql
    quoty = '"'
    truncate_import = "TRUNCATE TABLE imports"
    import_sql_load = "load data local infile '/media/Donnie/Websites/txLotto/doc/scratchoff.csv' into table imports fields terminated by ',' enclosed by '#{quoty}' lines terminated by '\n'; "
    import_sql_correct = "load data local infile '/media/Donnie/Websites/txLotto/doc/scratchoffFinal.csv' into table txlotto.imports fields terminated by ',' lines terminated by '\n' (gameNumber, gameName, gameDate, ticketPrice, prizeLevel, gamePrizes, prizeClaimed); "
    drop_first_two_tables = "DELETE FROM imports WHERE id between 1 and 2;"
    Import.connection.execute truncate_import
    Import.connection.execute import_sql_correct
    Import.connection.execute drop_first_two_tables
 end

def self.namesImport
    records = Import.where(:prizeLevel => "total")
     for record in records
      grandPrizeId = record.id - 1
      grand = Import.find_by_id(grandPrizeId)
        gPrizeRemain = grand.gamePrizes - grand.prizeClaimed
        name = Name.find_or_create_by_gameNumber(grand.gameNumber)
        name.grandRemain = gPrizeRemain
        name.gameName = grand.gameName
        name.price = record.ticketPrice
        name.prizeLevel = grand.prizeLevel
     name.save
     end
 end

 def self.purgeOld
  games = Name.find(:all)
  active = 0
  for game in games
    if Import.find_by_gameNumber(game.gameNumber)
      active = 1
    else
      active = 0
    end
    game.active = active
    game.save
  end
 end

def self.mech
  games = Name.find(:all)
  for game in games
    agent = Mechanize.new
    page = agent.get(game.url)
    ticket_total_string = agent.page.search(".scratchoffDetailsApproxTickets").map(&:text).map(&:strip)
    ticket_total_s = ticket_total_string.to_s
    ticket_total = ticket_total_s[ticket_total_s.index("approximately")+13..ticket_total_s.index(" tickets")-1]
    puts ticket_total
    game.tickets = ticket_total.delete(",")
    game.save
  end
end

def self.scratchoffs_Import
    games = Name.find(:all)
    for game in games
      if game.active = 1
      imports = Import.where(:gameNumber => game.gameNumber)
        for import in imports
          scratchoff = Scratchoff.find_or_create_by_import_id(import.id)
          scratchoff.gameNumber = import.gameNumber
          scratchoff.prizes_id = game.id
          scratchoff.closeDate = import.gameDate
          scratchoff.ticketPrice = import.ticketPrice
          scratchoff.prizeLevel = import.prizeLevel
          scratchoff.prizeTotal = import.gamePrizes
          scratchoff.prizeClaimed = import.prizeClaimed
          scratchoff.imports_id = import.id
          scratchoff.save
        end
      else
        Scratchoff.delete.where(:gameNumber => game.gameNumber)
      end
    end
  end

  def self.update_totalRemains
  	scratchoffs = Scratchoff.find(:all)
  	for scratchoff in scratchoffs
  		scratchoff.totalRemaining = scratchoff.prizeTotal - scratchoff.prizeClaimed
  		game = Name.find_by_id(scratchoff.prizes_id)
      if game.tickets && scratchoff.prizeTotal
        scratchoff.origOdds = game.tickets.to_f / scratchoff.prizeTotal
      end
  		scratchoff.save
  	end
  end

  def self.update_odds
    games = Name.find(:all)
    emailZ = false
    prizeid = 0
    even_money = 0
      for game in games
        scratchoffs = Scratchoff.where(:prizes_id => game.id) 
        for scratchoff in scratchoffs
          if scratchoff.ticketPrice == scratchoff.prizeLevel.to_i
            even_money = scratchoff.totalRemaining
            puts scratchoff.totalRemaining
            puts even_money
          end
        end
       	for scratchoff in scratchoffs
          if scratchoff.prizeLevel == "TOTAL"
            game.totalRemaining = scratchoff.totalRemaining
            game.origbeOdds = scratchoff.origOdds
            game.origOdds = game.tickets.to_f / (scratchoff.prizeTotal - even_money)
            game.currOdds = (game.tickets.to_f - (scratchoff.prizeClaimed * scratchoff.origOdds)) / (scratchoff.totalRemaining - even_money)
            game.percent_sold = game.tickets.to_f / (scratchoff.prizeClaimed * game.origOdds)
            #if scratchoff.prizeTotal
            #  game.origOdds = game.tickets.to_f / scratchoff.prizeTotal
            #end
            #if scratchoff.totalRemaining
            #  game.currOdds = (game.tickets.to_f - (scratchoff.prizeClaimed*game.origOdds)) / scratchoff.totalRemaining
            #end
            game.save
          end
        end
        for scratchoff in scratchoffs
            if scratchoff.totalRemaining != 0 && scratchoff.origOdds && game.tickets
              scratchoff.currOdds = (game.tickets.to_f - (scratchoff.prizeClaimed * scratchoff.origOdds)) / scratchoff.totalRemaining
            elsif scratchoff.totalRemaining == 0
              emailZ = true
              prizeid = scratchoff.prizes_id
            end
              scratchoff.save

        end
        #if emailZ
        #    BlogUpdater.emailZero(prizeid).deliver
        #    emailZ = false
        #end
          #game.totalRemaining = total - (totalc * game.origOdds)
  end

  def self.old_update_odds
    if scratchoff.prizeLevel == "total" && scratchoff.prizeTotal != 0 && game.tickets
              game.origOdds = game.tickets.to_f / scratchoff.prizeTotal
              game.totalRemaining = scratchoff.totalRemaining
              #elsif game.tickets == 0
                #flash[:notice] = game.gameName + game.url + " totalTickets = 0.  Get your lazy ass up and update me some ticket numbers"
                #BlogUpdater.newTicket(game.id).deliver
              elsif scratchoff.prizeLevel == "total" && scratchoff.prizeTotal == 0
                game.totalRemaining = scratchoff.totalRemaining
                game.origOdds = 0.01
              else
                #flash[:notice] = game.gameName + game.url + " your dumbass calculations were not set correctly and could not update the Names Original Odds so I have set them to 0"
                game.origOdds = 0.02
              end
              game.save
            end
            for scratchoff in scratchoffs
              if scratchoff.prizeLevel == "total" && scratchoff.totalRemaining == 0
                game.currOdds = 0
              elsif scratchoff.prizeLevel == "total" && scratchoff.totalRemaining != 0
                game.currOdds = (game.tickets.to_f - (scratchoff.prizeClaimed*game.origOdds)) / scratchoff.totalRemaining
              end
              game.save
            end
            for scratchoff in scratchoffs
              if scratchoff.totalRemaining && scratchoff.origOdds && game.tickets
                scratchoff.currOdds = (game.tickets.to_f - (scratchoff.prizeClaimed * scratchoff.origOdds)) / scratchoff.totalRemaining
              end
                scratchoff.save
            end
      end
end
