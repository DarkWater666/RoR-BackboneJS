class User < ActiveRecord::Base

  rolify

  extend FriendlyId
  friendly_id :login

  devise :database_authenticatable, :registerable, :timeoutable, :recoverable, :rememberable, :trackable, :validatable

  def role?
    return self.roles.present? ? self.roles.first.rus_name : 'тестер'
  end

end
