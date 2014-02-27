get '/comments/user/:user_id' do
  @user=User.find(params[:user_id])
  @comments = @user.comments

  erb :user_comments
end

get '/comments/:post_id' do
 @post = Post.find(params[:post_id])
 @user = User.find_by(id: "#{@post.user_id}")
 @comments = @post.comments

 erb :show_comments
end


post '/create_new_comment/:post_id' do

  if current_user?
    user= current_user
    params[:content]

    comment = Comment.create({content: params[:content],
      post_id: params[:post_id],
      user_id: current_user.id})

    redirect to "/comments/#{params[:post_id]}"
  else
    redirect to ('/sign_in')
  end
end
