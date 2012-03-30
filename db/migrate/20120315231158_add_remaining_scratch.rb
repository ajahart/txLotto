class AddRemainingScratch < ActiveRecord::Migration
  def up
  	add_column :scratchoffs, [:totalRemaining], :string
  end

  def down
  	add_column :names, [:totalRemaining], :string
  end
end
