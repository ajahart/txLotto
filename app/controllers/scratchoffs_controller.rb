class ScratchoffsController < ApplicationController
  # GET /scratchoffs
  # GET /scratchoffs.json
  def index
    @scratchoffs = Scratchoff.find(:all, :order => "gameNumber")
    @scratchoffsIndex = Scratchoff.find(:all, :conditions => ["ticketPrice < 51"], :order => "currOdds", :limit => 1)
    @scratchoffsAlls = Scratchoff.find(:all, :conditions => ["ticketPrice < 51"], :order => "currOdds", :limit => 1)
    @scratchoffsOnes = Scratchoff.find(:all, :conditions => ["ticketPrice = 1"], :order => "currOdds", :limit => 1)
    @scratchoffsTwos = Scratchoff.find(:all, :conditions => ["ticketPrice = 2"], :order => "currOdds", :limit => 1)
    @scratchoffsThrees = Scratchoff.find(:all, :conditions => ["ticketPrice = 3"], :order => "currOdds", :limit => 1)
    @scratchoffsFives = Scratchoff.find(:all, :conditions => ["ticketPrice = 5"], :order => "currOdds", :limit => 1)
    @scratchoffsSevens = Scratchoff.find(:all, :conditions => ["ticketPrice = 7"], :order => "currOdds", :limit => 1)
    @scratchoffsTens = Scratchoff.find(:all, :conditions => ["ticketPrice = 10"], :order => "currOdds", :limit => 1)
    @scratchoffsTwentyups = Scratchoff.find(:all, :conditions => ["ticketPrice > 19"], :order => "currOdds", :limit => 1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @scratchoffs }
    end
  end

  # GET /scratchoffs/1
  # GET /scratchoffs/1.json
  def show
    @Scratchoff = Scratchoff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @Scratchoff }
    end
  end

  # GET /scratchoffs/new
  # GET /scratchoffs/new.json
  def new
    @Scratchoff = Scratchoff.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @Scratchoff }
    end
  end

  # GET /scratchoffs/1/edit
  def edit
    @Scratchoff = Scratchoff.find(params[:id])
  end

  # POST /scratchoffs
  # POST /scratchoffs.json
  def create
    @Scratchoff = Scratchoff.new(params[:Scratchoff])

    respond_to do |format|
      if @Scratchoff.save
        format.html { redirect_to @Scratchoff, :notice => 'Scratchoff was successfully created.' }
        format.json { render :json => @Scratchoff, :status => :created, :location => @Scratchoff }
      else
        format.html { render :action => "new" }
        format.json { render :json => @Scratchoff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scratchoffs/1
  # PUT /scratchoffs/1.json
  def update
    @Scratchoff = Scratchoff.find(params[:id])

    respond_to do |format|
      if @Scratchoff.update_attributes(params[:Scratchoff])
        format.html { redirect_to @Scratchoff, :notice => 'Scratchoff was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @Scratchoff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scratchoffs/1
  # DELETE /scratchoffs/1.json
  def destroy
    @Scratchoff = Scratchoff.find(params[:id])
    @Scratchoff.destroy

    respond_to do |format|
      format.html { redirect_to scratchoffs_Scratchoff }
      format.json { head :ok }
    end
  end
    layout 'application'
  
  def create_Scratchoff
     scratchoff = Scratchoff.new(params[:item])
     Scratchoff.save()
     redirect_to :action => 'scratchoffs'
  end
  
  
  def loadScratchoffTable
     scratchoffs = Scratchoff.find(:all)
     for scratchoff in scratchoffs
      begin
       if scratchoff
        Scratchoff.getScratchoffData(Scratchoff)
      end
     rescue OpenURI::HTTPError
      scratchoffBrokenTitle = Scratchoff.title.to_s
      scratchoffBrokenId = Scratchoff.id.to_s
    end
       Scratchoff.updateOdds(Scratchoff)
     end
     if !ScratchoffBrokenId
      flash[:notice] = "Database has been updated!"
      redirect_to :action => 'index'
     else
      Scratchoff.broken_link(ScratchoffBrokenId)
      flash[:notice] = "Database has been updated! but " + ScratchoffBrokenTitle + " is broken and the id = " + ScratchoffBrokenId
      redirect_to :action => 'index'
    end
    BlogUpdater.dailyStats().deliver
    BlogUpdater.oneDollar().deliver
    BlogUpdater.twoDollar().deliver
    BlogUpdater.threeDollar().deliver
    BlogUpdater.fiveDollar().deliver
    BlogUpdater.sevenDollar().deliver
    BlogUpdater.tenDollar().deliver
    BlogUpdater.twentyupDollar().deliver
  end

  def sendEmail
    BlogUpdater.dailyStats().deliver
    redirect_to :action => 'index'
  end

  def oneEmail
    BlogUpdater.oneDollar().deliver
    redirect_to :action => 'index'
  end

  def twoEmail
    BlogUpdater.twoDollar().deliver
    redirect_to :action => 'index'
  end

  def threeEmail
    BlogUpdater.threeDollar().deliver
    redirect_to :action => 'index'
  end

  def fiveEmail
    BlogUpdater.fiveDollar().deliver
    redirect_to :action => 'index'
  end

  def sevenEmail
    BlogUpdater.sevenDollar().deliver
    redirect_to :action => 'index'
  end

  def tenEmail
    BlogUpdater.tenDollar().deliver
    redirect_to :action => 'index'
  end

  def twentyupEmail
    BlogUpdater.twentyupDollar().deliver
    redirect_to :action => 'index'
  end

  def mobileEmail
    BlogUpdater.mobileStats().deliver
    redirect_to :action => 'index'
  end
end
