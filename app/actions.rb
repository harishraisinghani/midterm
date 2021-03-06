helpers do
  def is_logged_in?
    session[:user_id] != nil
  end

  def set_current_user_and_session
    @user = User.find(31) #hard coding logged in user
    session[:user_id] = @user.id
  end

  def get_all_skills
    @skills = Skill.all
  end

end

# Homepage (Root path)
get '/' do
  set_current_user_and_session
  erb :index
end

post '/' do
  skill = Skill.find_by(name: params[:content].capitalize)
  if skill.nil?
    flash[:warning] = "This skill isn't available yet"
    redirect(back)
  else
    @skill_id = skill.id
    if is_logged_in?
      redirect "search/#{@skill_id}"
    end
  end
end

get '/search/:skill_id' do
  get_all_skills
  filter = params[:filter]
  if is_logged_in?
    set_current_user_and_session 
    @matches = UserSkill.where("skill_id = ?", params['skill_id']).paginate(:page => params[:page], :per_page => 5)
    if filter == "2"
      @matches = @matches.order(years_experience: :desc)
    # elsif filter == "1"
    #   @matches = User.connection.select_all("SELECT users.*, COUNT(feedbacks.id) AS feedbacks_count FROM users JOIN user_skills on user_skills.user_id = users.id JOIN feedbacks ON feedbacks.user_id = users.id WHERE user_skills.skill_id = 10 GROUP BY users.id ORDER BY feedbacks_count DESC;").paginate(:page => params[:page], :per_page => 5)
    end
    erb :search
  end
end

get '/profile/:id' do

  if is_logged_in?
    set_current_user_and_session
    @profile = User.find(params['id'])

    @all_feedback = @profile.feedbacks #sort_by { |feedback| feedback.created_at }.reverse
    @all_feedback = @profile.feedbacks.order('created_at').reverse_order.paginate(:page => params[:page], :per_page => 3)
    
   

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
    if
      feedback.save
      redirect(back)
    else
      redirect'/'
    end
  end
end

delete '/feedback/:id' do
  set_current_user_and_session
  target_feedback = Feedback.find(params[:id])
  target_feedback.destroy
  redirect(back)
end

post 'profile/skills' do

end

post '/favouriteds' do

end
