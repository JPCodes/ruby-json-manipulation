
require 'json' # Allows us to work with json

class User
  attr_accessor :email, :name, :permissions

  # *args creates array [email, name, permissions]
  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template # Method
  end

  def self.permissions_from_template
    file = File.read 'user_permissions_template.json'
    JSON.load(file, nil, symbolize_names: false) # Creates object(file, option, formatting)
  end

  def save # Pass stuff to JSON
    self_json = { # Var name can be anything
      email: @email,
      name: @name,
      permissions: @permissions
    }.to_json

    open('user.json', 'a') do |file| # a == append to
      file.puts self_json # adds it to the file, calling var
    end
  end

end
