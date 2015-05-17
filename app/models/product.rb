class Product < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :name, length: { minimum: 3 }, presence: true,uniqueness: true
  validates :price, presence: true, :numericality => {:only_integer => true}
  validates :img, presence: true
  validates :genre, presence: true
  validates :link, presence: true

  def self.search(search, type)	  
  	if type == "Name"
    	where("name LIKE ?", "%#{search}%")	  
    elsif type == "Price"
    	where("price = ?", search)	  
    elsif type == "Genre"
    	where("genre LIKE ?", "%#{search}%")	      
    elsif type == "Random"
      where("name LIKE ? OR genre LIKE ? OR des LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")   
    end
  end
end
