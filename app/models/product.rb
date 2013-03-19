class Product < ActiveRecord::Base
  attr_accessible :description, :image, :price, :title, :category_id, :expansion, :expansion_id
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :expansion
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  searchable do
    text :title, boost: 5
    text :description
  end
  
  private
    
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
