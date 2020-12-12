class Batch::DataReset
	def self.data_reset
		Review.where.not(id: 1..40).delete_all
		Comment.where.not(id: 1..60).delete_all
		Food.where.not(id: 1..30).delete_all
	end
end
