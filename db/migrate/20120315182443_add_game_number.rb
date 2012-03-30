class AddGameNumber < ActiveRecord::Migration
  def up
  	  	add_column :names, [:gameNumber], :string
  end

  def down
  end
end
