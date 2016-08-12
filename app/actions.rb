helpers

# Homepage (Root path)
get '/' do
  erb :index
end

get '/search/:skill_id' do
  erb :search
end

get '/profile/:id' do
  @user = User.find(params[:id])
  erb :profile
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
