class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :gameName
      t.integer :origOdds
      t.integer :currOdds
      t.integer :grandRemain
    end
  end
end
