# This is a non-generic controller, written to provide an endpoint for
# searching within the application

class SearchController < ApplicationController
  # Only an index action is provided, as that is the only one required
  def index
    # This is assigning the result of the block to the @search variable
    # the search method is provided by the Sunspot gem, which is looking
    # for fulltext matched of the passes term parameter
    @search = Product.search do
      fulltext params[:term]
    end
    
    # The results of @search are then assigned to the @products instance
    # variable for use in the view
    @products = @search.results
    
    respond_to do |format|
      format.html # index.html.erb
      # The json responding format here is very important, as it is vital
      # for providing the autocomplete functionality on the search
      format.json { render json: @products }
    end
  end
end
