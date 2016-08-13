helpers do
  def is_logged_in?
    session[:user_id] != nil
  end
end

# Homepage (Root path)
get '/' do
  @user = User.find(2)
  session[:user_id] = @user.id
  erb :index
end

post '/' do
  skill = Skill.find_by(name: params[:content].capitalize)
  @skill_id = skill.id
  if is_logged_in?
    redirect "search/#{@skill_id}"
  end
end

get '/search/:skill_id' do
  if is_logged_in?
    @matches = UserSkill.where("skill_id = ?", params['skill_id']).paginate(page: params[:page], per_page: 5)
    @user = User.find(session[:user_id])
  end
  erb :search
end

get '/profile/:id' do

  if is_logged_in?
    @user = User.find(session[:user_id])
    @profile = User.find(params['id'])
   
    @teacher_avg_feedback=@profile.feedbacks.where(user_type:2).average(:rating)
    @student_avg_feedback=@profile.feedbacks.where(user_type:1).average(:rating)

    if @teacher_avg_feedback
      @teacher_avg_feedback
    else
      @teacher_avg_feedback = 0
    end

    if @student_avg_feedback
      @student_avg_feedback
    else
      @student_avg_feedback = 0
    end    
    erb :profile
  else
    redirect '/'
  end 
end

post '/favourites' do
  "figure out yo faves"
end

post '/feedback' do
  if is_logged_in?
    feedback = Feedback.new(
      user_id: params[:user_id],
      rating: params["input-4"],
      user_type: params[:user_type],
      content: params[:content]
      )
    feedback.save
    redirect(back)
  else
    redirect(back)
  end
end

delete '/profile/:id/feedbacks/:id' do
 "for feedback deletion"
end

post 'profile/skills' do

end

post '/favouriteds' do

end
