class Budget < ActiveRecord::Base
  attr_accessible :customer_id, :total_amount, :total_budget, :total_discount, :total_value
end
