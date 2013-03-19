class SearchController < ApplicationController
  def index
    @search = Product.search do
      fulltext params[:term]
    end
    
    @products = @search.results
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
