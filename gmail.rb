require 'gmail'
require 'dotenv'
require 'pry'

require '../D11_Gmail/scrapping'



Dotenv.load

#class Connexion

#  def initialize
    username = ENV['username']
    password = ENV['password']
 Gmail.connect(username,password) do |v|
puts v.logged_in?

v.deliver do
  to "email@example.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Text of plaintext message."
  end
    end
    binding.pry
  end
 # end

#end


puts "Do you want to run the script for getting mail adresses ? [Y/N]"
user_input = gets.chomp

if user_input == "Y"
elsif user_input == "N"
  else
   puts  "Exiting the program"
 end
