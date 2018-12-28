require 'spec_helper'

describe ActiveRecord::Narcissus::Reflection do

  it 'uses the correctly namespaced model' do
    Post.create()
    Post.first

    sql = Post.first.user_widgets.to_sql
    expect(sql).to match(Regexp.new(<<~SQL.squish))
      SELECT "user_widgets".* FROM "user_widgets"
        INNER JOIN "users" ON "user_widgets"."user_id" = "users"."id"
      WHERE "users"."id" .*
    SQL
  end

end
