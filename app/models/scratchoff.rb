class Scratchoff < ActiveRecord::Base

	def self.prizeStats
		records = ImportCell.where(:contents => "total")
	 for record in records
	 	id = record.row_index - 1
	 	prize.gameName = ImportCell.content.where(:row_index => id, :column_index => 4)
	 end
	 table.save
	end

	def self.scratchoffStats
		records = ImportCell.find(:all, conditions => ["row_index > ?",2])
	end

end
