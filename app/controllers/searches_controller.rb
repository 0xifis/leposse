class SearchesController < ApplicationController
  def show
  	@search = Game.search(params[:query])
  end
end
