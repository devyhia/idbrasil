# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130530093832) do

  create_table "budget_products", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "product_id"
    t.decimal  "quantity"
    t.decimal  "price"
    t.decimal  "value"
    t.decimal  "discount"
    t.decimal  "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "budgets", :force => true do |t|
    t.integer  "customer_id"
    t.decimal  "total_amount"
    t.decimal  "total_value"
    t.decimal  "total_discount"
    t.decimal  "total_budget"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "cost"
    t.decimal  "profit"
    t.boolean  "forsale"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "rights"
  end

end
