class Genre < ActiveRecord::Base
  validates :name, length: { minimum: 3 }, presence: true,uniqueness: true
end
