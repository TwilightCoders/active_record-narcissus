require 'user'

class User
  class Widget < ::Widget
  	self.table_name = "user_widgets"
    belongs_to :user
  end
end
