class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :refuelings

  enum theme_color: { light_theme: 0, dark_theme: 1 }

  def change_theme_color
    update_attribute :theme_color, light_theme? ? :dark_theme : :light_theme
  end
end
