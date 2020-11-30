class Batch::DataReset
	def self.data_reset
		Sauna.where.not(id: 1..11).delete_all
	end
end

# id指定と悩み中
# User.where("users.created_at < ?", "2020-11-28").delete_all
# User.where("users.created_at >", "2020-10-01").delete_all ✖︎