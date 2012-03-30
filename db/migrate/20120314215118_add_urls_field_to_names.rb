class AddUrlsFieldToNames < ActiveRecord::Migration
  def change
  	add_column :names, [:url], :string
  end
end
