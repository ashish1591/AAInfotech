class System < ApplicationRecord
	belongs_to :customer,  inverse_of: :systems

end
