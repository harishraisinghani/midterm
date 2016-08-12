class UserSkillsImporter

  def import

    users = User.all
    
    users.each do |user|

      rand(1..10).times do
        random_skill = rand(1..24)
        skill = Skill.find(random_skill) 
        
        if !UserSkill.where(user_id: user.id, skill_id: skill.id).exists?
          puts "Assigning "+skill.name+" to "+user.first_name+"!"
          UserSkill.create(skill_id: skill.id, user_id: user.id, years_experience: rand(1..7)) 
        end

      end

    end

  end

end

 