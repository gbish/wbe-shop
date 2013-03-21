class Product < ActiveRecord::Base
  # creates getter and setter methods for the listed attributes
  attr_accessible :description, :image, :price, :title, :category_id, :expansion, :expansion_id
  
  # mounts a CarrierWave uploader onto this model
  mount_uploader :image, ImageUploader
  
  # establishes an association between this model and the ones listed
  belongs_to :category
  belongs_to :expansion
  has_many :line_items
  
  # before a Product is destroyed, ensure none are referenced by a LineItem
  before_destroy :ensure_not_referenced_by_any_line_item
  
  # ensures the listed attributes are filled in when a new Product is created
  validates :description, :image, :price, :title, presence: true
  
  # adds Sunspot indexing to the title and description attributes
  # the title attribute is ranked as more important (boost: 5)
  searchable do
    text :title, boost: 5
    text :description
  end
  
  private
    
    # checks if a product is associated to any line item (checked through association)
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
