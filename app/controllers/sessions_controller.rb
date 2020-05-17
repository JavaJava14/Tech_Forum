class SessionsController < ApplicationController

  get '/home' do
    if logged_in?
      erb :home
    else
      redirect '/login'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/home'
    else
      erb :'/users/login.html'
    end
  end

  post '/login' do 
    if params[:username].empty? || params[:password].empty?
      @error = "Please fill in Username and password"
      erb :'/users/login.html'
    else
      if user = User.find_by(username: params[:username] ,password: params[:password]) 
      session[:user_id] = user.id
      redirect '/home'
      else
      @error = "Account not found"
      erb :'/users/login.html'
      end
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
