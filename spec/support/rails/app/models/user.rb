class User < ApplicationRecord

  has_many :posts
  has_many :comments

  # These will be of type User::Widget by default based on namespacing
  has_many :widgets

end
