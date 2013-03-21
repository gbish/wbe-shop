class User < ActiveRecord::Base
  # specifies the devise modules in use for this type of user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # create getters + setters for the listed attributes
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
