require 'gmail'
require 'dotenv'
require 'pry'

require_relative 'scrapping'



Dotenv.load

#class Connexion

#  def initialize
    username = ENV['username']
    password = ENV['password']
 Gmail.connect(username,password) do |v|
puts v.logged_in?

v.deliver do
      binding.pry
  to "email@example.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Text of plaintext message."
  end
    end

  end
 # end

#end


puts "Do you want to run the script for getting mail adresses ? [Y/N]"
user_input = gets.chomp

if user_input == "Y"
  all
elsif user_input == "N"
  puts  "Exiting the program"
  else
   puts  "Exiting the program"
 end
