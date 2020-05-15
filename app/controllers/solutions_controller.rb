class SolutionsController < ApplicationController

  # GET: /solutions
  get "/solutions" do
    erb :"/solutions/index.html"
  end

  # GET: /solutions/new
  get "/solutions/new" do
    erb :"/solutions/new.html"
  end

  # POST: /solutions
  post "/solutions" do
    redirect "/solutions"
  end

  # GET: /solutions/5
  get "/solutions/:id" do
    erb :"/solutions/show.html"
  end

  # GET: /solutions/5/edit
  get "/solutions/:id/edit" do
    erb :"/solutions/edit.html"
  end

  # PATCH: /solutions/5
  patch "/solutions/:id" do
    redirect "/solutions/:id"
  end

  # DELETE: /solutions/5/delete
  delete "/solutions/:id/delete" do
    redirect "/solutions"
  end
end
