class Product < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :name, length: { minimum: 3 }, presence: true,uniqueness: true
  validates :price, presence: true, :numericality => {:only_integer => true}
  validates :img, presence: true
  validates :genre, presence: true

  def self.search(search)	  
	    where("name LIKE ?", "%#{search}%")	  
	end
end
