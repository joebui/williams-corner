class Account < ActiveRecord::Base
	has_many :orders, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true
	validates :password, confirmation: true, presence: true, length: {minimum: 3}
	validates :password_confirmation, presence: true

	def self.search(search)	  
	    where("name LIKE ?", "%#{search}%")	  
	end
end