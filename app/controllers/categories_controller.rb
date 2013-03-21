# This is a very generic controller

class CategoriesController < ApplicationController
  # Making sure users are authenticated as an admin to 
  # view the actions in this controller, except the show action
  before_filter :authenticate_admin!, :except => [:show]

  def index
    # paginate the results, 15 per page (all pagination takes this form)
    @categories = Category.page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    # get the category object for the passed ID
    @category = Category.find(params[:id])
    # get all the products where the category_id (foreign key) 
    # is the same as the passed ID, then paginate results, 9 per page
    @products = Product.where("category_id = ?", params[:id]).page(params[:page]).per(9)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
