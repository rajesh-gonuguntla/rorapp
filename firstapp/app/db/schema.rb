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

ActiveRecord::Schema.define(:version => 20131011163116) do

  create_table "cart_items", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "price"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "cart_id"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.boolean  "admin"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.float    "price"
    t.integer  "quantity"
    t.integer  "products_id"
    t.integer  "orders_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "order_items", ["orders_id"], :name => "index_order_items_on_orders_id"
  add_index "order_items", ["products_id"], :name => "index_order_items_on_products_id"

  create_table "orders", :force => true do |t|
    t.string   "email"
    t.string   "phone_number"
    t.string   "ship_to_first_name"
    t.string   "ship_to_last_name"
    t.string   "ship_to_address"
    t.string   "ship_to_country"
    t.string   "ship_to_state"
    t.string   "ship_to_city"
    t.string   "ship_to_zip"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "status"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "sub_category_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "availability"
  end

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
