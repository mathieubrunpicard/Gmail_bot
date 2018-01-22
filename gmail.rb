require 'gmail'
require 'dotenv'
require 'pry'

Dotenv.load

class Connexion

  def connect
    @username = ENV['username']
    @password = ENV['password']
    Gmail.connect(@username,@password)
  end

end


gmail = Connexion.new
gmail.connect
puts gmail.connect.logged_in?
