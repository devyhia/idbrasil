class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :cost
      t.decimal :profit
      t.boolean :forsale

      t.timestamps
    end
  end
end
