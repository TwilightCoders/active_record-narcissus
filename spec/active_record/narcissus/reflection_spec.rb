require 'spec_helper'

describe ActiveRecord::Narcissus::Reflection do

  it 'finds the nested namespaced model' do
    Post.create()
    Post.first

    sql = Post.first.user_widgets.to_sql
    expect(sql).to match(Regexp.new(<<~SQL.squish))
      SELECT "user_widgets".* FROM "user_widgets"
        INNER JOIN "users" ON "user_widgets"."user_id" = "users"."id"
      WHERE "users"."id" .*
    SQL
  end

  it 'does not find the nested namespaced model' do
    user = User.create
    post = user.posts.create

    3.times do |time|
      post.comments.create(body: "foo#{time}")
    end

    allow(Post).to receive(:const_get).with('Comment').and_raise(NameError)

    sql = User.first.post_comments.to_sql
    expect(sql).to match(Regexp.new(<<~SQL.squish))
      SELECT "comments".* FROM "comments"
        INNER JOIN "posts" ON "comments"."post_id" = "posts"."id"
      WHERE "posts"."user_id" .*
    SQL
  end

end
