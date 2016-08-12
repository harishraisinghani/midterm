class Favourite < ActiveRecord::Base

  belongs_to :favourited_user, foreign_key: :user_id, class_name: :User  
  belongs_to :favourite_user, foreign_key: :favourite_user_id, class_name: :User

end