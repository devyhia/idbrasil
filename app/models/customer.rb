class Customer < ActiveRecord::Base
  attr_accessible :id, :cpf, :email, :name, :phone
end
