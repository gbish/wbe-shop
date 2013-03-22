class LineItem < ActiveRecord::Base
  # creates getter and setter methods for the listed attributes
  attr_accessible :cart_id, :product_id, :quantity
  
  # establishes an association with the listed models
  # this is the ONE side in a ONE to many association
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  # calculates the total price of a line item row
  def total_price
    product.price * quantity
  end
end
