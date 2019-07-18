class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get "/" do 
    erb :welcome
  end

  get "/recipes" do 
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes/new" do 
    @recipe = Recipe.create(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do 
    @recipe = Recipe.find(params[:id])
    erb :edit
    
  end

  put "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete "recipes/:id" do 
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end



end
