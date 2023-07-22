class CreateInitialSchema < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, default: "", null: false
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :name
      t.string :jti, null: false
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :completed
      t.string :deadline
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :jti, unique: true
    add_index :users, :reset_password_token, unique: true

    add_foreign_key :categories, :users
    add_foreign_key :tasks, :categories
    add_foreign_key :tasks, :users
  end
end
