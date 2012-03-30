class AddUrlsField < ActiveRecord::Migration
  def up
  	add_column :scratchoffs, [:url], :string
  end

  def down
  end
end
