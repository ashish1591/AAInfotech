class Complaint < ApplicationRecord
	has_many :problems, dependent: :destroy
	has_many :payments, dependent: :destroy

	belongs_to :customer
	belongs_to :system

	def get_pending_problems
		self.problems.select {|x| x.problem_status!='complete'}
	end
end
