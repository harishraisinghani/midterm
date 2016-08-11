class Skill < ActiveRecord::Base

  #shit to do with our Skill class
  validates :name, presence: true, length: { minimum: 4 }

end