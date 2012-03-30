# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120329223613) do

  create_table "import_cells", :force => true do |t|
    t.integer  "import_table_id"
    t.integer  "row_index"
    t.integer  "column_index"
    t.string   "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "import_cells", ["import_table_id"], :name => "index_import_cells_on_import_table_id"

  create_table "import_tables", :force => true do |t|
    t.string   "original_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", :force => true do |t|
    t.integer  "gameNumber"
    t.string   "gameName"
    t.string   "gameDate"
    t.integer  "ticketPrice"
    t.string   "prizeLevel"
    t.integer  "gamePrizes"
    t.integer  "prizeClaimed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "names", :force => true do |t|
    t.string  "gameName"
    t.decimal "origOdds",       :precision => 10, :scale => 2
    t.decimal "currOdds",       :precision => 10, :scale => 2
    t.integer "grandRemain"
    t.string  "url"
    t.integer "tickets"
    t.string  "gameNumber"
    t.integer "totalRemaining"
    t.integer "percent_sold"
    t.decimal "origbeOdds",     :precision => 10, :scale => 2
    t.decimal "active",         :precision => 10, :scale => 0
    t.integer "price"
    t.string  "prizeLevel"
  end

  create_table "olds", :force => true do |t|
    t.string  "state",          :limit => 2
    t.string  "title",          :limit => 40
    t.string  "ticketnum",      :limit => 20
    t.string  "ball",           :limit => 500
    t.string  "price",          :limit => 2
    t.integer "totalMade"
    t.integer "totalTickets"
    t.integer "totalRemaining"
    t.decimal "currOdds",                      :precision => 3, :scale => 0
    t.integer "origOdds"
  end

  create_table "scratchoffs", :force => true do |t|
    t.integer "gameNumber"
    t.integer "prizes_id"
    t.date    "closeDate"
    t.integer "ticketPrice"
    t.string  "prizeLevel"
    t.integer "prizeTotal"
    t.integer "prizeClaimed"
    t.decimal "origOdds",       :precision => 10, :scale => 2
    t.decimal "currOdds",       :precision => 10, :scale => 2
    t.integer "import_id"
    t.string  "url"
    t.integer "totalRemaining"
    t.integer "imports_id"
  end

  create_table "urls", :force => true do |t|
    t.string  "state",          :limit => 2
    t.string  "title",          :limit => 40
    t.string  "ticketnum",      :limit => 20
    t.string  "url",            :limit => 500
    t.string  "price",          :limit => 2
    t.integer "totalMade"
    t.integer "totalTickets"
    t.integer "totalRemaining"
    t.decimal "currOdds",                      :precision => 3, :scale => 0
    t.integer "origOdds"
  end

end
