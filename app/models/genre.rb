class Genre < ActiveRecord::Base
  validates :name, length: { minimum: 3 }, presence: true,uniqueness: true

  def self.search(search)	  
	    where("name LIKE ?", "%#{search}%")	  
	end
end
