class AddImportsField < ActiveRecord::Migration
  def up
  	add_column :scratchoffs, [:import_id], :integer
  end

  def down
  end
end
