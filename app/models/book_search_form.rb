class BookSearchForm
  extend ActiveModel::Naming  
  include ActiveModel::Conversion  
  
  attr_accessor :shelf_id, :latest
  
  def initialize(params)
    self.shelf_id = params[:shelf_id] if params
    self.latest = params[:latest] if params
  end
  
  def persisted?
    false
  end
end
