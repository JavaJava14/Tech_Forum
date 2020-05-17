class ForumsController < ApplicationController

  get "/forums/motherboard/new" do 
    if logged_in?
      erb :"/forums/motherboard/new.html"
    else
      redirect '/login'
    end
  end

  post "/forums/motherboard" do
    @guide = current_user.forums.build(params)
    #@guide = Forum.new(params)
    if !params[:title].empty?
      @guide.save
      redirect "/forums/motherboard"
    else
      @error = "Please submit title and comment."
      erb :'forums/motherboard/new.html'
    end
  end

  # GET: /forums
  get "/forums" do
    if logged_in?
      erb :"/forums/index.html"
    else
      redirect '/error'
    end
  end

  get "/forums/motherboard" do
    if logged_in?
      @guide = Forum.all
      erb :"/forums/motherboard/index.html"
    else
      redirect '/login'
    end
  end
  
  get "/forums/cpu" do
    erb :"/forums/cpu/index.html"
  end

  get "/forums/memory" do
    erb :"/forums/memory/index.html"
  end

  get "/forums/storage" do
    erb :"/forums/storage/index.html"
  end

  get "/forums/graphic_card" do
    erb :"/forums/graphic_card/index.html"
  end

  # GET: /forums/5
  get "/forums/:id" do
    erb :"/forums/show.html"
  end

  get "/forums/motherboard/:id" do
    if logged_in?
      @guide = Forum.find(params[:id])
      erb :"/forums/motherboard/show.html"
    else
      redirect '/login'
    end
  end

  get "/forums/motherboard/:id/edit" do 
    @guide = Forum.find(params[:id])
    erb :'/forums/motherboard/edit.html'
  end

  patch '/forums/motherboard/:id' do
    @guide = Forum.find(params[:id])
    if params[:guide][:title] != ""
      @guide.update(params[:guide])
      redirect "/forums/motherboard"
    else
      @error = "Please submit title and comment."
      erb :'forums/motherboard/edit.html'
    end
  end

  delete '/forums/motherboard/:id' do
    @guide = Forum.find(params[:id])
    @guide.destroy
    redirect '/forums/motherboard'
  end
end
