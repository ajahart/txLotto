class AddActive < ActiveRecord::Migration
  def up
  	add_column :names, [:active], :decimal
  end

  def down
  end
end
