class BlogUpdater < ActionMailer::Base
  default :from => "alexjonespodcasts@gmail.com"

  def dailyStats()
    @grands = Name.find(:all, :conditions => ["active = 1"], :order => "grandRemain desc", :limit => 3)
    @grandsize = Name.find(:all, :conditions => ["active = 1 AND grandRemain > 0"], :order => "LENGTH(prizeLevel) desc", :limit => 3)
    @tickets = Name.find(:all, :conditions => ["grandRemain = 0 AND active = 1"])
    @namesAlls = Name.find(:all, :conditions => ["price < 51"], :order => "currOdds", :limit => 10)
    @namesOnes = Name.find(:all, :conditions => ["price = 1"], :order => "currOdds")
    @namesTwos = Name.find(:all, :conditions => ["price = 2"], :order => "currOdds")
    @namesThrees = Name.find(:all, :conditions => ["price = 3"], :order => "currOdds")
    @namesFives = Name.find(:all, :conditions => ["price = 5"], :order => "currOdds")
    @namesSevens = Name.find(:all, :conditions => ["price = 7"], :order => "currOdds")
    @namesTens = Name.find(:all, :conditions => ["price = 10"], :order => "currOdds")
    @namesTwentyups = Name.find(:all, :conditions => ["price > 19"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[Daily]All Texas Scratch-Offs " + Date.today.to_s(:long_ordinal))
  end

  def zeroGrand()
    @tickets = Name.find(:all, :conditions => ["grandRemain = ?", 0])
    names = Name.find(:all, :conditions => ["id = ?", id])
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[Zero] Zero Grand Prizes Remaining" + Date.today.to_s(:long_ordinal))
  end

  def emailZero(id)
    game = Name.find_by_id(id)
    @link = game.url
    @gameName = game.gameName
    @scratchoffs = Scratchoff.find(:all, :conditions => ["prizes_id = ?", id])
    mail(:to => "ajalonh@gmail.com", :subject => "Zero Prize Remaining, is something wrong?")
  end

  def newTicket(id)
    tickets = Scratchoff.find(:all, :conditions => ["prizes_id = ?", id])
    names = Name.find(:all, :conditions => ["id = ?", id])
    mail(:to => "support@techsysranger.com", :subject => "New Ticket Added" + Date.today.to_s(:long_ordinal))
  end

  def oneDollar()
    @namesOnes = Name.find(:all, :conditions => ["price = 1"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$1] $1 Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def twoDollar()
    @namesTwos = Name.find(:all, :conditions => ["price = 2"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$2] $2 Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def threeDollar()
    @namesThrees = Name.find(:all, :conditions => ["price = 3"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$3] $3 Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def fiveDollar()
    @namesFives = Name.find(:all, :conditions => ["price = 5"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$5] $5 Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def sevenDollar()
    @namesSevens = Name.find(:all, :conditions => ["price = 7"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$7] $7 Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def tenDollar()
    @namesTens = Name.find(:all, :conditions => ["price = 10"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$10] $10 Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def twentyupDollar()
    @namesTwentyups = Name.find(:all, :conditions => ["price > 19"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[$20] $20+ Texas Scratch-offs " + Date.today.to_s(:long_ordinal))
  end

  def mobileStatsOrig()
    @namesAlls = Name.find(:all, :conditions => ["price < 51"], :order => "currOdds", :limit => 1)
    @namesOnes = Name.find(:all, :conditions => ["price = 1"], :order => "currOdds", :limit => 1)
    @namesTwos = Name.find(:all, :conditions => ["price = 2"], :order => "currOdds", :limit => 1)
    @namesThrees = Name.find(:all, :conditions => ["price = 3"], :order => "currOdds", :limit => 1)
    @namesFives = Name.find(:all, :conditions => ["price = 5"], :order => "currOdds", :limit => 1)
    @namesSevens = Name.find(:all, :conditions => ["price = 7"], :order => "currOdds", :limit => 1)
    @namesTens = Name.find(:all, :conditions => ["price = 10"], :order => "currOdds", :limit => 1)
    @namesTwentyups = Name.find(:all, :conditions => ["price > 19"], :order => "currOdds", :limit => 1)
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[mob]Texas Lotto Scratch-Off Stats Updated " + Date.today.to_s(:long_ordinal))
  end

  def mobileStats
    @grands = Name.find(:all, :conditions => ["active = 1"], :order => "grandRemain desc", :limit => 3)
    @grandsize = Name.find(:all, :conditions => ["active = 1 AND grandRemain > 0"], :order => "LENGTH(prizeLevel) desc", :limit => 3)
    @tickets = Name.find(:all, :conditions => ["grandRemain = 0 AND active = 1"])
    @namesAlls = Name.find(:all, :conditions => ["price < 51"], :order => "currOdds", :limit => 10)
    @namesOnes = Name.find(:all, :conditions => ["price = 1"], :order => "currOdds")
    @namesTwos = Name.find(:all, :conditions => ["price = 2"], :order => "currOdds")
    @namesThrees = Name.find(:all, :conditions => ["price = 3"], :order => "currOdds")
    @namesFives = Name.find(:all, :conditions => ["price = 5"], :order => "currOdds")
    @namesSevens = Name.find(:all, :conditions => ["price = 7"], :order => "currOdds")
    @namesTens = Name.find(:all, :conditions => ["price = 10"], :order => "currOdds")
    @namesTwentyups = Name.find(:all, :conditions => ["price > 19"], :order => "currOdds")
    mail(:to => "alottostats032012@ajpfiles.com", :subject => "[mo]All Texas Scratch-Offs " + Date.today.to_s(:long_ordinal))
  end
end
