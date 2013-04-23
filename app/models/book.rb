class Book < ActiveRecord::Base
  attr_accessible :description, :name, :volume, :shelf_id
  belongs_to :shelf
  scope :latest_by_shelf, lambda {|id|
    @result = []
    h = where('shelf_id = :sid', :sid => "#{id}").group("books.name").maximum(:volume)
    h.each_pair {|key, value|
      @result.push(find_by_name_and_volume(key, value))
    }
    return @result
  }
  scope :latest, lambda {
    @result = []
    h = group("books.name").maximum(:volume)
    h.each_pair {|key, value|
      @result.push(find_by_name_and_volume(key, value))
    }
    return @result
  }
end
