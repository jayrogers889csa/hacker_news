get '/sign_in' do

  erb :sign_in
end

get '/create_new_account' do

  erb :create_new_account
end

get '/sign_out' do

  # session[:user_id] = nil
  session.clear

  redirect to ('/')
end

post '/sign_in' do

  user = User.find_by_username(params[:user][:username])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect to ('/')
  else
    @errors = {:Invalid => ["Incorrect Login"]}
    erb :sign_in
  end
end

post '/create_new_account' do

  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect to ('/')
  else
    @errors = user.errors.messages
    erb :create_new_account
  end
end
