class Cart < ActiveRecord::Base
  # sets up the relation from this model to the LineItem model
  # this is the many end of that relationship, this will destroy any
  # associated line items when the cart itself is destroyed
  has_many :line_items, dependent: :destroy
  
  # looks for a product in the line_items object
  # if one is found, it increments its quantity by 1,
  # else it creates a line item
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
  
  # calculates the total price of line items in the cart
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
