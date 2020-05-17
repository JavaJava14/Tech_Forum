class UsersController < ApplicationController

  get '/register' do
    if logged_in?
      redirect '/home'
    else
      erb :'/users/register.html'
    end
  end

  post '/register' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/home'
    elsif User.find_by(username: user.username)
      @error = "Account with that username already exists"
      erb :'/users/register.html'
    else
      @error = "Please fill out every field below"
      erb :'/users/register.html'
    end
  end
end