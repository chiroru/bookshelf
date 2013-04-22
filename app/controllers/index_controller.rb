class IndexController < ApplicationController
  def index
    @book_search_form = BookSearchForm.new params[:book_search_form]
    @shelves = Shelf.all
    if @book_search_form.shelf_id.blank? then
      logger.error '================='
      #key = @shelves[0].id
      #@books = Book.where(:shelf_id => key)
      @books = Book.all
    else
      key = @book_search_form.shelf_id
      if @book_search_form.latest == "1" then
        #@books = []
        #h = Book.where('shelf_id = :sid', :sid => "#{key}").group("books.name").maximum(:volume)
        #@books = @books.latest_by_shelf(key)
        #h.each_pair {|key, value|
        #  @books.push(Book.find_by_name_and_volume(key, value))
        #}
        @books = Book.latest_by_shelf(key)
      else
        @books = Book.where(:shelf_id => key)
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shelves }
    end
  end
end
