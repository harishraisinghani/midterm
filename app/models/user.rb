class User < ActiveRecord::Base

  has_many :userskills
  has_many :favourites
  has_many :favourite_users, through: :favourites, class_name: :User
  has_many :favouriteds, class_name: :Favourite, foreign_key: :favourite_user_id
  has_many :favourited_users, through: :favouriteds, class_name: :User
  has_many :feedbacks


  validates :email,  
    presence: true,
    uniqueness: true,
    format: { with: /.+@.+\.+/i, message: "invalid email format" }

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true



end