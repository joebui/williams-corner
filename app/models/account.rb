class Account < ActiveRecord::Base	
	attr_accessor :remember_token, :activation_token
	before_save { self.email = email.downcase }
	before_create :create_activation_digest

	has_many :order_items, dependent: :destroy
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  # :confirmable,
  # devise :database_authenticatable, :registerable, 
  #        :recoverable, :rememberable, :trackable, :validatable  

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

	def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

	def forget
  	update_attribute(:remember_digest, nil)
	end

	# Creates and assigns the activation token and digest.
  def create_activation_digest
    	self.activation_token  = Account.new_token
    	self.activation_digest = Account.digest(activation_token)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    AccountMailer.account_activation(self).deliver_now
  end
end
