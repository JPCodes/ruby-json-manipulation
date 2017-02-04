require 'pp' # Styles output
require_relative 'user' # Class file user.rb

user = User.new 'jpcodes@example.com', 'James'

pp user # output

user.save # save method from user.rb
