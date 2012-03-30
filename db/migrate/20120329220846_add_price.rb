class AddPrice < ActiveRecord::Migration
  def up
  	add_column :names, [:price], :integer
  end

  def down
  end
end
