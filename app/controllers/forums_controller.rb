class ForumsController < ApplicationController

  get "/forums/motherboard/new" do 
    erb :"/forums/motherboard/new.html"
  end

  post "/forums/motherboard" do
    @guide = Forum.new(params)
    @guide.save
    redirect "/forums/motherboard"
  end

  # GET: /forums
  get "/forums" do
    erb :"/forums/index.html"
  end

  get "/forums/motherboard" do
    @guide = Forum.all
    erb :"/forums/motherboard/index.html"
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
    @guide = Forum.find(params[:id])
    erb :"/forums/motherboard/show.html"
  end

end
