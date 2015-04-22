class Account < ActiveRecord::Base
	attr_accessor :remember_token
	has_many :order_items, dependent: :destroy

	validates :name, presence: true, uniqueness: true, uniqueness: {case_sensitive: false} 
	validates :email, presence: true
	validates :password, confirmation: true, presence: true, length: {minimum: 5}, allow_blank: false
	validates :password_confirmation, presence: true
  
	has_secure_password
	
	def self.search(search)	  
	    where("name LIKE ?", "%#{search}%")	  
	end

	def Account.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
	end

	def Account.new_token
    	SecureRandom.urlsafe_base64
  	end

  	def remember
    	self.remember_token = Account.new_token
    	update_attribute(:remember_digest, Account.digest(remember_token))
  	end

  	def authenticated?(remember_token)
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end

  	def forget
    	update_attribute(:remember_digest, nil)
  	end
end