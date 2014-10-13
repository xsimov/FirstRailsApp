class SearchesController < ApplicationController
  def create
    search = Search.new
    search.query = search_params["query"]
    search.field = search_params["field"]
    @results = search.execute!
    return render 'index' unless @results.nil?
    render text: {search_results: "FieldError: Try with 'locations' OR 'users'"}.to_json
  end

  private
  def search_params
    params.require(:search).permit(:query, :field)
  end
end