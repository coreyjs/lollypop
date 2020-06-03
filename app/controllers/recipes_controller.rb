class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  before_action :ensure_authenticated_recipe, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]

  include UseCases::Recipes

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show

  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit

  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    output = RecipeCreatedMutation.run(recipe: @recipe)

    if output.success?
      puts 'everything went super duper good'
    end
    respond_to do |format|
      if @recipe.save


        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.active.find(params[:id])
    end

  # this method is our authroizer to ensure a user can only
  # do actions on their own recipe
  def ensure_authenticated_recipe
    return unless user_signed_in?

    @recipe = Recipe.internal_active.find_by!(
        id: params[:id],
        user_id: current_user.id
    )
  end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :slug, :deleted, :active, :description,
                                     :photo, :instructions, :cook_time, :prep_time, :private)
    end
end
