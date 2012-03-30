class NamesController < ApplicationController
  require 'mechanize'
  # GET /names
  # GET /names.json

  def updateStats
    #Name.importSql()
    #Name.namesImport()
    #Name.purgeOld
    #Name.mech
    #Name.scratchoffs_Import()
    #Name.update_totalRemains
    #Name.update_odds
    BlogUpdater.dailyStats.deliver
    #BlogUpdater.mobileStats.deliver
    redirect_to :action => 'index'
  end

  def updateOdds
    Name.update_odds
    redirect_to :action => 'index'
  end

  def screen_scrape
    urls = 
    agent = Mechanize.new
    page = agent.get('')
  end

  def prizeGrands
    prizes = Prize.find(:all)
     for prize in prizes
      name = prize.name
      id = prize.id
      records = ImportCell.where(:contents => name)
        for record in records
          id = 
          Scratchoffs.find_or_create_by_prizeLevel(pLevel)
      end
     end
  end

  def index
    @names = Name.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @names }
    end
  end

  # GET /names/1
  # GET /names/1.json
  def show
    @name = Name.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @name }
    end
  end

  # GET /names/new
  # GET /names/new.json
  def new
    @name = Name.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @name }
    end
  end

  # GET /names/1/edit
  def edit
    @name = Name.find(params[:id])
  end

  # POST /names
  # POST /names.json
  def create
    @name = Name.new(params[:name])

    respond_to do |format|
      if @name.save
        format.html { redirect_to @name, :notice => 'Name was successfully created.' }
        format.json { render :json => @name, :status => :created, :location => @name }
      else
        format.html { render :action => "new" }
        format.json { render :json => @name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /names/1
  # PUT /names/1.json
  def update
    @name = Name.find(params[:id])

    respond_to do |format|
      if @name.update_attributes(params[:name])
        format.html { redirect_to @name, :notice => 'Name was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    @name = Name.find(params[:id])
    @name.destroy

    respond_to do |format|
      format.html { redirect_to names_url }
      format.json { head :ok }
    end
  end

    def convert_Urls
      names = Name.find(:all)
        for name in names
          if !name.totalTickets
            old = Old.find_by_title(name.gameName)
              if !old
              end
            #new_url = old.ball
            #name.ball = new_url
            name.totalTickets = old.totalTickets
            name.save
          else
          end
      end
    end

      def zeroGrand
        BlogUpdater.zeroGrand().deliver
        redirect_to :action => "index"
      end

      def emailZero
        BlogUpdater.emailZero(21).deliver
        redirect_to :action => "index"
      end
end
