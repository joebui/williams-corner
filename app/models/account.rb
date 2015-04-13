class Account < ActiveRecord::Base
	has_many :order_items, dependent: :destroy

	validates :name, presence: true, uniqueness: true, uniqueness: {case_sensitive: false} 
	validates :email, presence: true
	validates :password, confirmation: true, presence: true, length: {minimum: 3}
	validates :password_confirmation, presence: true

	has_secure_password
	
	def self.search(search)	  
	    where("name LIKE ?", "%#{search}%")	  
	end
end