class ExpansionsController < ApplicationController
  # Making sure users are authenticated as an admin to 
  # view the actions in this controller, except the show action
  before_filter :authenticate_admin!, :except => [:show]

  def index
    @expansions = Expansion.page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expansions }
    end
  end

  def show
    @expansion = Expansion.find(params[:id])
    @products = Product.where("expansion_id = ?", params[:id]).page(params[:page]).per(9)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expansion }
    end
  end

  def new
    @expansion = Expansion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expansion }
    end
  end

  def edit
    @expansion = Expansion.find(params[:id])
  end

  def create
    @expansion = Expansion.new(params[:expansion])

    respond_to do |format|
      if @expansion.save
        format.html { redirect_to @expansion, notice: 'Expansion was successfully created.' }
        format.json { render json: @expansion, status: :created, location: @expansion }
      else
        format.html { render action: "new" }
        format.json { render json: @expansion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expansion = Expansion.find(params[:id])

    respond_to do |format|
      if @expansion.update_attributes(params[:expansion])
        format.html { redirect_to @expansion, notice: 'Expansion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expansion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expansion = Expansion.find(params[:id])
    @expansion.destroy

    respond_to do |format|
      format.html { redirect_to expansions_url }
      format.json { head :no_content }
    end
  end
end
