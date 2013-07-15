class CreateBudgetProducts < ActiveRecord::Migration
  def self.up
    create_table :budget_products do |t|
      t.integer :budget_id
      t.integer :product_id
      t.decimal :quantity
      t.decimal :price
      t.decimal :value
      t.decimal :discount
      t.decimal :total

      t.timestamps
    end
  end
end
