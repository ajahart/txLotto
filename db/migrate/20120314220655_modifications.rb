class Modifications < ActiveRecord::Migration
  def up
  	add_column :names, [:totalTickets], :integer
  end

  def down
  end
end
