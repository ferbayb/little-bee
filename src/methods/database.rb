# frozen_string_literal: true

# require postgres gem
require 'pg'
# require sequel gem for database control
require 'sequel'
# require class, user.
require_relative '../classes/class_user'
# require class, child
require_relative '../classes/class_child'
# declare database constant
DB = Sequel.connect('postgres://flintzb:flintzb@us-mm-west-ed217cabc0f5.g5.cleardb.net:5432/users_db')

def load_db(value)
  case value
  when 'login_db'
    db_table = DB[:login_db]
    db_table.all.each do |listing|
      User.new(listing)
    end
  when 'child_db'
    db_table = DB[:child_db]
    db_table.all.each do |listing|
      ChildProfile.new(listing)
    end
  end
end
