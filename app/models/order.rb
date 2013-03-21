class Order < ActiveRecord::Base
  # creates getter and setter methods for the listed attributes
  attr_accessible :address, :email, :name, :pay_type
  
  # establishes and association with the LineItem model
  # when an order is destroyed, its related line_items are destroyed as well
  has_many :line_items, dependent: :destroy
  
  # creates an array available through the Order::PAYMENT_TYPES constant
  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
  
  # ensures the listed fields are filled out when trying to create a new object
  validates :name, :address, :email, :pay_type, presence: true
  # ensures the pay_type attribute includes values from the PAYMENT_TYPES array
  validates :pay_type, inclusion: PAYMENT_TYPES
  
  # gets the passes cart object and loops over the line items
  # nils an items cart id and appends the item to line items
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
