class Rating < ActiveRecord::Base
	belongs_to :product
	
	validates :comment, presence: true

	def self.search(search)	  
	    where("account_name LIKE ?", "%#{search}%")	  
	end
end
