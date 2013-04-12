class Book < ActiveRecord::Base
  attr_accessible :description, :name, :volume
end
