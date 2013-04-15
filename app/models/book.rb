class Book < ActiveRecord::Base
  attr_accessible :description, :name, :volume, :shelf_id
  belongs_to :shelf
end
