class Expansion < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :release_date, :logo
  mount_uploader :logo, LogoUploader
  has_many :products
end
