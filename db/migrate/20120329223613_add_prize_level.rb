class AddPrizeLevel < ActiveRecord::Migration
  def up
  	add_column :names, [:prizeLevel], :string
  end

  def down
  end
end
