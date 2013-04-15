class Shelf < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :books
end
