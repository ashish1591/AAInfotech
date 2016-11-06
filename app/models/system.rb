class System < ApplicationRecord
	has_many :complaints, dependent: :destroy
	
	belongs_to :customer,  inverse_of: :systems

end
