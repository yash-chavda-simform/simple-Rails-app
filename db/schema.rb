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

ActiveRecord::Schema[7.0].define(version: 2023_04_05_100403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_actions", force: :cascade do |t|
    t.string "house_name"
    t.string "street_name"
    t.string "road"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_action_id", null: false
    t.index ["employee_action_id"], name: "index_address_actions_on_employee_action_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.text "content"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "business_customer_routers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_actions", force: :cascade do |t|
    t.string "employee_name"
    t.string "email"
    t.string "password_digest"
    t.string "gender"
    t.string "address"
    t.string "mobile_number"
    t.date "birth_date"
    t.boolean "hobbies"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.integer "no_of_order"
    t.boolean "full_time_available"
    t.bigint "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version", default: 0, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organizer_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_no"
    t.string "email"
    t.date "birth_date"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "alt_txt"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "new_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_renderings", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_rendering_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_rendering_id"], name: "index_order_renderings_on_product_rendering_id"
  end

  create_table "order_routers", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_router_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_router_id"], name: "index_order_routers_on_product_router_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "query_product_id", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["query_product_id"], name: "index_orders_on_query_product_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "rails_user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["rails_user_id"], name: "index_post_comments_on_rails_user_id"
  end

  create_table "post_javascripts", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.bigint "rails_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rails_user_id"], name: "index_posts_on_rails_user_id"
  end

  create_table "posts_rails_users", id: false, force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "rails_user_id", null: false
    t.index ["post_id", "rails_user_id"], name: "index_posts_rails_users_on_post_id_and_rails_user_id", unique: true
  end

  create_table "product_renderings", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_routers", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "query_products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "price"
    t.integer "capacity"
    t.boolean "is_active"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "department"
    t.date "birth_date"
    t.binary "term_and_condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_products", force: :cascade do |t|
    t.string "product_name"
    t.decimal "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_rendering_id", null: false
    t.index ["user_rendering_id"], name: "index_test_products_on_user_rendering_id"
  end

  create_table "user_actions", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_renderings", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_user_renderings_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_renderings_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "users_events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_users_events_on_event_id"
    t.index ["user_id"], name: "index_users_events_on_user_id"
  end

  add_foreign_key "address_actions", "employee_actions"
  add_foreign_key "books", "authors"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "users", column: "organizer_id"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "users"
  add_foreign_key "order_renderings", "product_renderings"
  add_foreign_key "order_routers", "product_routers"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "query_products"
  add_foreign_key "test_products", "user_renderings"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "rails_users"
  add_foreign_key "posts", "rails_users"
  add_foreign_key "users_events", "events"
  add_foreign_key "users_events", "users"
end
