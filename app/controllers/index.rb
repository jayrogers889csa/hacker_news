get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_in' do

  erb :sign_in
end

post '/sign_in' do

  user = User.find_by(params[:user][:username])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect to ('/')
  else
    @errors = {:Invalid => ["Incorrect Login"]}
    erb: 'sign_in'
  end
end

post '/sign_out' do

  session[:user_id] = nil

  redirect to ('/')
end
