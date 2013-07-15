class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
