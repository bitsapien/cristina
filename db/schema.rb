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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161213105252) do

  create_table "conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",       limit: 65535
    t.boolean  "understood"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "friends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "conversations_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["conversations_id"], name: "index_friends_on_conversations_id", using: :btree
  end

  create_table "my_tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",      limit: 65535
    t.integer  "status"
    t.datetime "deadline"
    t.integer  "conversations_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["conversations_id"], name: "index_my_tasks_on_conversations_id", using: :btree
  end

  create_table "task_discussions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "my_tasks_id"
    t.integer  "conversations_id"
    t.text     "body",             limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["conversations_id"], name: "index_task_discussions_on_conversations_id", using: :btree
    t.index ["my_tasks_id"], name: "index_task_discussions_on_my_tasks_id", using: :btree
  end

  create_table "task_parents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "friends_id"
    t.integer  "my_tasks_id"
    t.integer  "conversations_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["conversations_id"], name: "index_task_parents_on_conversations_id", using: :btree
    t.index ["friends_id"], name: "index_task_parents_on_friends_id", using: :btree
    t.index ["my_tasks_id"], name: "index_task_parents_on_my_tasks_id", using: :btree
  end

  create_table "task_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "friends_id"
    t.integer  "my_tasks_id"
    t.integer  "conversations_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["conversations_id"], name: "index_task_teams_on_conversations_id", using: :btree
    t.index ["friends_id"], name: "index_task_teams_on_friends_id", using: :btree
    t.index ["my_tasks_id"], name: "index_task_teams_on_my_tasks_id", using: :btree
  end

  add_foreign_key "friends", "conversations", column: "conversations_id"
  add_foreign_key "my_tasks", "conversations", column: "conversations_id"
  add_foreign_key "task_discussions", "conversations", column: "conversations_id"
  add_foreign_key "task_discussions", "my_tasks", column: "my_tasks_id"
  add_foreign_key "task_parents", "conversations", column: "conversations_id"
  add_foreign_key "task_parents", "friends", column: "friends_id"
  add_foreign_key "task_parents", "my_tasks", column: "my_tasks_id"
  add_foreign_key "task_teams", "conversations", column: "conversations_id"
  add_foreign_key "task_teams", "friends", column: "friends_id"
  add_foreign_key "task_teams", "my_tasks", column: "my_tasks_id"
end
