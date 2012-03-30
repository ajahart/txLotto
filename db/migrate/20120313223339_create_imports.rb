class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :gameNumber
      t.string :gameName
      t.string :closeDate
      t.integer :ticketPrice
      t.string :prizeLevel
      t.integer :totalPrizes
      t.integer :prizeClaimed

      t.timestamps
    end
  end
end
