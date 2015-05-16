class Rating < ActiveRecord::Base
	belongs_to :product
	
	validates :comment, presence: true

	def self.search(search, type)
		if type == "Username"	  
			acc_id = Account.find_by_name(search)
			if acc_id == nil
		    	all
		    else
		    	where("account_id = ?", acc_id.id)	  
	    	end	
		elsif type == "Game"
			prod_id = Product.find_by_name(search)
			if prod_id == nil
		    	all
		    else
		    	where("product_id = ?", prod_id.id)	  		
	    	end			    
	    elsif type == "Star"
	    	where("stars LIKE ?", "%#{search}%")	      	
		end
	end
end
