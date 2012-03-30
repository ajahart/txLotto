class AddRemaining < ActiveRecord::Migration
  def up
  	add_column :names, [:totalRemaining], :string
  end

  def down
  end
end
