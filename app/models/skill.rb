class Skill < ActiveRecord::Base
  
  belongs_to :userskill

  validates :name, 
    presence: true, 
    length: { minimum: 4 }

end