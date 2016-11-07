class Customer < ApplicationRecord
	has_many :addresses,  inverse_of: :customer, dependent: :destroy
	has_many :contacts,  inverse_of: :customer, dependent: :destroy 
	has_many :emails,  inverse_of: :customer, dependent: :destroy
	has_many :systems,  inverse_of: :customer, dependent: :destroy

	has_many :complaints,  dependent: :destroy

	accepts_nested_attributes_for :addresses, :allow_destroy => true, reject_if: proc { |attributes| attributes['name'].blank? }
	accepts_nested_attributes_for :contacts, :allow_destroy => true, reject_if: proc { |attributes| attributes['number'].blank? }
	accepts_nested_attributes_for :emails, :allow_destroy => true, reject_if: proc { |attributes| attributes['eid'].blank? }
	accepts_nested_attributes_for :systems, :allow_destroy => true

	def get_full_name
		first = (self.first_name.nil?) ? "" : self.first_name 
		last = (self.last_name.nil?) ? "" : self.last_name 
		
		first + " " + last 
	end
end

