class Contact < ApplicationRecord
	belongs_to :customer,  inverse_of: :contacts
	
end
