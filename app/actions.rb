# Homepage (Root path)
get '/' do
  erb :index
end

get '/search' do
  erb :search
end

get '/profile' do
  erb :profile
end

