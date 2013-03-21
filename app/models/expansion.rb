class Expansion < ActiveRecord::Base
  # creates getter and setter methods for the listed atributes
  attr_accessible :abbreviation, :name, :release_date, :logo
  
  # mounts a CarrierWave uploader to this class
  mount_uploader :logo, LogoUploader
   
  # establishes an association with the Product model
  has_many :products
end
