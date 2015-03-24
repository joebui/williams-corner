class Product < ActiveRecord::Base
  validates :name, length: { minimum: 3 }, presence: true,uniqueness: true
  validates :price, presence: true, :numericality => {:only_integer => true}
  validates :img, presence: true
  validates :genre, presence: true
end
