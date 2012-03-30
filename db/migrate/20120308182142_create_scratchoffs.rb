class CreateScratchoffs < ActiveRecord::Migration
  def change
    create_table :scratchoffs do |t|
      t.integer :gameNumber
      t.integer :prizes_id
      t.date :closeDate
      t.integer :ticketPrice
      t.string :prizeLevel
      t.integer :prizeTotal
      t.integer :prizeClaimed
      t.integer :origOdds
      t.integer :currOdds
    end
  end
end
