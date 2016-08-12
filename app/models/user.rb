class User < ActiveRecord::Base

  has_many :userskills
  has_many :fav_send, class_name: :Favourite, foreign_key: :user_id
  has_many :fav_send_users, through: :fav_send, class_name: :User
  has_many :fav_receive, class_name: :Favourite, foreign_key: :favourite_user_id
  has_many :fav_receive_users, through: :fav_receive, class_name: :User
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