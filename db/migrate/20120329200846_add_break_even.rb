class AddBreakEven < ActiveRecord::Migration
  def up
  	add_column :names, [:origbeOdds], :decimal
  end

  def down
  end
end
