class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
      t.integer :customer_id
      t.decimal :total_amount
      t.decimal :total_value
      t.decimal :total_discount
      t.decimal :total_budget

      t.timestamps
    end
  end
end
