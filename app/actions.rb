helpers

# Homepage (Root path)
get '/' do
  erb :index
end

get '/search/:skill_id' do
  erb :search
end

get '/profile/:id' do
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
