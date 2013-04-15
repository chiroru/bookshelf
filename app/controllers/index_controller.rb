class IndexController < ApplicationController
  def index
    @book_search_form = BookSearchForm.new params[:book_search_form]
    @shelves = Shelf.all
    if @book_search_form.shelf_id.blank? then
      logger.error '================='
      key = @shelves[0].id
      @books = Book.where(:shelf_id => key)
    else
      logger.error '------------------' + @book_search_form.shelf_id
      key = @book_search_form.shelf_id
      @books = Book.where(:shelf_id => key)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shelves }
    end
  end
end
