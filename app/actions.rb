helpers do
  def is_logged_in?
    session[:user_id] != nil
  end

  def set_current_user_and_session
    @user = User.find(2) #hard coding logged in user
    session[:user_id] = @user.id
  end

end

# Homepage (Root path)
get '/' do
  set_current_user_and_session
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
  set_current_user_and_session if is_logged_in?
  erb :search
end

get '/profile/:id' do

  if is_logged_in?
    set_current_user_and_session
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
    set_current_user_and_session
    feedback = Feedback.new(
      user_id: params[:profile_id],
      rating: params["input-4"],
      user_type: params[:user_type],
      content: params[:content],
      profile_id: @user.id
      )
    feedback.save
    redirect(back)
  else
    redirect(back)
  end
end

delete '/feedback/:id' do
  target_feedback=Feedback.find(params[:id])
  target_feedback.destroy
  redirect(back)
end

post 'profile/skills' do

end

post '/favouriteds' do

end
