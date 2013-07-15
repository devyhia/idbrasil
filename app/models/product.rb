class Product < ActiveRecord::Base
  attr_accessible :cost, :description, :forsale, :name, :profit
end
