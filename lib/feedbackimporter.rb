class FeedbackImporter
 
  def teacher?

    rand(1..2) == 2
 
  end

  def randomRating

    rand(1..5)

  end

  def import

    users = User.all
    
    users.each do |user|

      puts "Generating Fake Feedback for "+user.first_name+"!"
      rand(1..6).times do

        rating = randomRating

        person_being_rated = 2
        person_being_rated = 1 unless teacher?

        if person_being_rated == 2

          if rating >= 2
            content = user.first_name + " was a good teacher"
          else
            content = user.first_name + " was a bad teacher"
          end 
        else
          if rating >= 2
            content = user.first_name + " was a good student"
          else
            content = user.first_name + " was a bad student"
          end
        end

        feedback = Feedback.create(profile_id: rand(1..30), user_id: user.id, rating: rating, user_type: person_being_rated, content: content) 
      
      end

    end

  end

end