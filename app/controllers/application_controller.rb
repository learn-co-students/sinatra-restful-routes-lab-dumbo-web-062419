require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #root
  get "/" do

  end

  #index
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  #new
  get "/recipes/new" do
    erb :new
  end

  #create
  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #show
  get "/recipes/:id" do
    find_recipe
    erb :show
  end

  #edit
  get "/recipes/:id/edit" do
    find_recipe
    erb :edit
  end

  #update
  patch "/recipes/:id" do
    find_recipe
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete
  delete "/recipes/:id" do
    find_recipe
    @recipe.destroy
    redirect to "/recipes"
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
