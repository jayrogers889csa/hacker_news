get '/new_post' do

  erb :create_new_post
end

get '/my_posts/:user_id' do

  @posts = Post.where(user_id: session[:user_id])

  erb :my_posts
end

get '/show_posts/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts

  erb :user_posts
end

post '/create_new_post/:user_id' do

  params[:post][:user_id] = session[:user_id]
  post = Post.new(params[:post])

  if post.save
    redirect to "/"
  else
    @errors = post.errors.messages
    erb :create_new_post
  end
end

