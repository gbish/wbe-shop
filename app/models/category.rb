class Category < ActiveRecord::Base
  # creates getter and setter methods for the listed attributes
  attr_accessible :name
  
  # establishes a association with the Product model
  has_many :products
end
