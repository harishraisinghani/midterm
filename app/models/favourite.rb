class Favourite < ActiveRecord::Base
  
  belongs_to :favourited_user, foreign_key: :user_id, class_name: :User  
  belongs_to :favourite_user, foreign_key: :favourite_user_id, class_name: :User
 
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :whouserliked, :class_name => 'User', :foreign_key => 'favourite_user_id'
end