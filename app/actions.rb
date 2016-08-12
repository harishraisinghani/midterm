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
    @profile = User.find(params['id'])
    erb :profile
  else
    redirect '/'
  end 
end

post '/favourites' do
  "figure out yo faves"
end

post '/profile/:id/feedbacks' do

end

delete '/profile/:id/feedbacks/:id' do
 "for feedback deletion"
end

post 'profile/skills' do

end

post '/favouriteds' do

end
