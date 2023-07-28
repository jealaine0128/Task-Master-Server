class CreateInitialSchema < ActiveRecord::Migration[7.0]
  def change

    create_table :users do |t|
      t.string :email, default: "", null: false
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string :name
      t.string "jti", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["jti"], name: "index_users_on_jti", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    create_table :categories do |t|
      t.string :name
      t.integer :user_id, null: false
      t.timestamps
    end

    add_foreign_key :categories, :users

    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :completed
      t.string :deadline
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end

    add_foreign_key :tasks, :categories
    add_foreign_key :tasks, :users

  end
end