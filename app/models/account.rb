class Account < ActiveRecord::Base
	has_many :orders, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true
	validates :password, confirmation: true, presence: true, length: {minimum: 2}
	validates :password_confirmation, presence: true
end