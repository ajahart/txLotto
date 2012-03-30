class AddImportsId < ActiveRecord::Migration
  def up
  	add_column :scratchoffs, [:imports_id], :integer
  end

  def down
  end
end
