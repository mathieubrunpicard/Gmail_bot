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
    puts "The content of the email will be the following: "
    puts "Bonjour,
    Je m'appelle Mathieu Brun-Picard et je suis actuellement élève à une formation de code : The Hacking Project (http://thehackingproject.org/).
    Cette formation est gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau.
    Nous apprenons l'informatique en faisant des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes.
    Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

    Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{value}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.
    Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre d'élèves, donc nous serions ravis de travailler avec #{value} !
    Si vous voulez avoir plus d'information sur la formation, n'hésitez pas à visiter mon blog où je décris le quotidien des étudiants : https://medium.com@mathieu.bp/ .

    Si vous avez des questions sur la formation, n'hésitez pas à me recontacter.
    Bien à vous,

    Mathieu Brun-Picard"

    puts "Press Yes to continue [Y/N]"
    user_input = gets.chomp
    if user_input == "Y"
      require_relative 'mail_content'
    elsif
      puts "Closing the program"

    end
  elsif
    puts "Closing the program"
  end
end

first_choice



