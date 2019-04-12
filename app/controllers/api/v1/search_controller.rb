class Api::V1::SearchController < ApplicationController
  def index
    search_service = SearchService.new(params[:search])
    render json: search_service.call
  end
end
