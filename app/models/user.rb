class User < ActiveRecord::Base

  has_many :user_skills
  has_many :feedbacks

   has_many :fav_send, class_name: :Favourite, foreign_key: :user_id
   has_many :fav_send_users, through: :fav_send, class_name: :User
   has_many :fav_receive, class_name: :Favourite, foreign_key: :favourite_user_id
   has_many :fav_receive_users, through: :fav_receive, class_name: :User

  #has_many :favourites



  # @user.favourites.each do |favourite|
  #   puts favouurite.favourite_user.name
  # end

  # people_that_fav_me = Favourite.where(favourite_user: @user)

  validates :email,  
    presence: true,
    uniqueness: true,
    format: { with: /.+@.+\.+/i, message: "invalid email format" }

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  def display_name
    "#{first_name} #{last_name}"
  end

  # def display_skills
  #   skills = self.user_skills.sort_by do |userskill|
  #     1 - userskill.years_experience
  #   end
  # end


end