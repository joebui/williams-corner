class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :account
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def discount
    discount = self[:discount].to_f
  end
  
  def total_price
    unit_price * quantity * discount.to_f
  end
  
  def self.search(search, type)	  
      if type == "Owner"
          owner_id = Account.find_by_name(search)
          if owner_id == nil
            all            
          else
            where("owner_id = ?", owner_id)
          end
      elsif type == "Game"
          product_id = Product.find_by_name(search)
          if product_id == nil
            all            
          else 
            where("product_id = ?", product_id)           
          end          
      elsif type == "Status"
          where("status LIKE ?", "%#{search}%")      
      end
         
	end
	 
  private
    def product_present
      if product.nil?
        errors.add(:product, "is not valid or is not active.")
      end
    end

  

  def finalize
    if discount == 0
      discount = 1
    end
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price] * discount.to_f
  end
  
end
