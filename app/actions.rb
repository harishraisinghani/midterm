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
  skill = Skill.find_by(name: params[:content])
  skill_id = skill.id
  if is_logged_in?
    redirect "search/#{skill_id}"
  end
end

get '/search/:skill_id' do
  if is_logged_in?
    @user = User.find(session[:user_id])
  end
  erb :search
end

get '/profile/:id' do
  if is_logged_in?
    @user = User.find(session[:user_id])
  else
    redirect '/'
  end
  erb :profile
end

post '/favourites' do
  "figure out yo faves"
end

post '/profile/feedbacks' do

end

delete '/profile/feedback/:id' do
 "for feedback deletion"
end

post 'user/skills' do

end

post '/favouriteds' do

end
