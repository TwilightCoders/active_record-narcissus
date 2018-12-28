ActiveRecord::Schema.define do

  self.verbose = false

  create_table :users, schema: :public, force: true do |t|
    t.string :email, index: :btree
    t.timestamps null: false
  end

  create_table :posts, force: true do |t|
    t.integer :user_id
    t.string :title
    t.timestamps null: false
  end

  create_table :widgets, force: true do |t|
    t.string :title
    t.timestamps null: false
  end

  create_table :user_widgets, force: true do |t|
    t.integer :user_id
    t.timestamps null: false
  end

  create_table :comments, force: true do |t|
    t.integer :user_id
    t.integer :post_id
    t.timestamps null: false
  end

end
