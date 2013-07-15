class BudgetProducts < ActiveRecord::Base
  attr_accessible :budget_id, :discount, :price, :product_id, :quantity, :total, :value
end
