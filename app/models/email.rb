class Email < ApplicationRecord
	belongs_to :customer,  inverse_of: :emails
end
