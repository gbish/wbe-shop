class Admin < ActiveRecord::Base
  # specifies the devise modules in use for this type of user
  devise :database_authenticatable, :trackable, :timeoutable, :lockable  
  
  # create getters + setters for the listed attributes
  attr_accessible :email, :password, :password_confirmation
end
