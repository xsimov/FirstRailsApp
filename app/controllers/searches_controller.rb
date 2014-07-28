class SearchesController < ApplicationController
  def create
    search = Search.new
    search.query = search_params["query"]
    @locations = Location.where("name LIKE '%#{search.query}%'")
    render '/locations/index'
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end
end
