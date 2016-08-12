class Feedback < ActiveRecord::Base

  belongs_to :user

  validates :rating,
    numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  validates :user_type,
    numericality: { only_integer: true }

  validates :content, 
    presence: true,
    length: { maximum: 500 }
  
end