# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_28_155946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cartdetails", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "foodrestaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["cart_id", "foodrestaurant_id"], name: "index_cartdetails_on_cart_id_and_foodrestaurant_id", unique: true
    t.index ["cart_id"], name: "index_cartdetails_on_cart_id"
    t.index ["foodrestaurant_id"], name: "index_cartdetails_on_foodrestaurant_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurantmanagement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurantmanagement_id"], name: "index_carts_on_restaurantmanagement_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "foodrestaurants", force: :cascade do |t|
    t.bigint "restaurantmanagement_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.integer "quantity"
    t.index ["food_id"], name: "index_foodrestaurants_on_food_id"
    t.index ["restaurantmanagement_id"], name: "index_foodrestaurants_on_restaurantmanagement_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "food_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "foodrestaurant_id", null: false
    t.integer "quantity"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodrestaurant_id"], name: "index_order_details_on_foodrestaurant_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "order_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurantmanagements", force: :cascade do |t|
    t.string "restaurant_name"
    t.string "address"
    t.string "email"
    t.bigint "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cartdetails", "carts"
  add_foreign_key "cartdetails", "foodrestaurants"
  add_foreign_key "carts", "restaurantmanagements"
  add_foreign_key "carts", "users"
  add_foreign_key "foodrestaurants", "foods"
  add_foreign_key "foodrestaurants", "restaurantmanagements"
  add_foreign_key "order_details", "foodrestaurants"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "users"
end
