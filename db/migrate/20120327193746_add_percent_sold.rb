class AddPercentSold < ActiveRecord::Migration
  def up
  	add_column :names, [:percent_sold], :integer
  end

  def down
  end
end
