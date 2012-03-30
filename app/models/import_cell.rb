class ImportCell < ActiveRecord::Base
	 belongs_to :import_table
	 belongs_to :prize

  def prizeStats
    records = ImportCell.where(:contents => "total")

     for record in records
      id = record.row_index - 1
      Prize.gameName = ImportCell.content.where(:row_index => id, :column_index => 4)
     end
     table.save
  end
end
