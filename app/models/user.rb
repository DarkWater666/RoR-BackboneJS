class User < ActiveRecord::Base

  rolify

  extend FriendlyId
  friendly_id :login

  devise :database_authenticatable, :registerable, :timeoutable, :recoverable, :rememberable, :trackable, :validatable

end
