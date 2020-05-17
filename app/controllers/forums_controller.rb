class ForumsController < ApplicationController

  get "/forums/computer/new" do 
    if logged_in?
      erb :"/forums/computer/new.html"
    else
      redirect '/login'
    end
  end

  post "/forums/computer" do
    @guide = current_user.forums.build(params)
    #@guide = Forum.new(params)
    if !params[:title].empty? && !params[:comment].empty?
      @guide.save
      redirect "/forums/computer"
    else
      @error = "Please submit title and comment."
      erb :'forums/computer/new.html'
    end
  end

  # GET: /forums
  get "/forums" do
    if logged_in?
      erb :"/forums/index.html"
    else
      redirect '/login'
    end
  end

  get "/forums/computer" do
    if logged_in?
      @guide = Forum.all
      erb :"/forums/computer/index.html"
    else
      redirect '/login'
    end
  end

  get "/forums/computer/:id" do
    if logged_in?
      @guide = Forum.find(params[:id])
      erb :"/forums/computer/show.html"
    else
      redirect '/login'
    end
  end

  get "/forums/computer/:id/edit" do 
    @guide = Forum.find(params[:id])
    erb :'/forums/computer/edit.html'
  end

  patch '/forums/computer/:id' do
    @guide = Forum.find(params[:id])
    if params[:guide][:title] != "" && params[:guide][:comment] != ""
      @guide.update(params[:guide])
      redirect "/forums/computer"
    else
      @error = "Please submit title and comment."
      erb :'forums/computer/edit.html'
    end
  end

  delete '/forums/computer/:id' do
    @guide = Forum.find(params[:id])
    @guide.destroy
    redirect '/forums/computer'
  end
end
