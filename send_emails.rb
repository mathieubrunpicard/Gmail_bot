require 'json'

def first_choice
  puts "Do you want to run the script for getting mail adresses ? [Y/N]"
  user_input = gets.chomp
  if user_input == "Y"
    require_relative 'scrapping'
    second_choice
  elsif
    puts "Closing the program"

  end
end

def second_choice

  puts "Saving all the adresses in a spreadsheet and a json"
  require_relative 'spreadsheet'

  Write_Spreadsheet.spreadsheet_writing

  third_choice


end

def third_choice
  puts "Do you want to send them an email? [Y/N]"
  user_input = gets.chomp
  if user_input == "Y"
    puts "The content of the email will be the following:"
    require_relative 'mail_content'

  elsif
    puts "Closing the program"
  end
end

first_choice



