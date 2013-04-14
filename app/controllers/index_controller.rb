class IndexController < ApplicationController
  def index
    @shelves = Shelf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shelves }
    end
  end

  def serach
  end
end
