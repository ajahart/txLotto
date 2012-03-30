class ImportTablesController < ApplicationController
  # GET /import_tables
  # GET /import_tables.json
  def index
    @import_tables = ImportTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @import_tables }
    end
  end

  # GET /import_tables/1
  # GET /import_tables/1.json
  def show
    @import_table = ImportTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @import_table }

    @import_cells = @import_table.import_cells
    @row_index_max = @import_cells.map { |cell| cell.row_index }.max
    @column_index_max = @import_cells.map { |cell| cell.column_index }.max
    end
  end

  # GET /import_tables/new
  # GET /import_tables/new.json
  def new
    @import_table = ImportTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @import_table }
    end
  end

  # GET /import_tables/1/edit
  def edit
    @import_table = ImportTable.find(params[:id])
  end

  # POST /import_tables
  # POST /import_tables.json
  def create
    @import_table = ImportTable.new(params[:import_table])

    respond_to do |format|
      if @import_table.save
        format.html { redirect_to @import_table, :notice => 'Import table was successfully created.' }
        format.json { render :json => @import_table, :status => :created, :location => @import_table }
      else
        format.html { render :action => "new" }
        format.json { render :json => @import_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import_tables/1
  # PUT /import_tables/1.json
  def update
    @import_table = ImportTable.find(params[:id])

    respond_to do |format|
      if @import_table.update_attributes(params[:import_table])
        format.html { redirect_to @import_table, :notice => 'Import table was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @import_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import_tables/1
  # DELETE /import_tables/1.json
  def destroy
    @import_table = ImportTable.find(params[:id])
    @import_table.destroy

    respond_to do |format|
      format.html { redirect_to import_tables_url }
      format.json { head :ok }
    end
  end
end
