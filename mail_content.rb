require 'gmail'
require 'dotenv'
require 'pry'
require 'json'
require 'email_address'
Dotenv.load

#1st Method togo through the json file
def read_json
  file = File.read('townhall.json')
  jason = JSON.parse(file)
  return jason
end

#2nd Method to go through the hash and get all the mails and the names
def read_hash(gmail, my_hash)

  @my_hash = my_hash
  @gmail = gmail

  @my_hash.each do |key, value|
    unless value == "" && EmailAddress.valid?(value)
      content = body_content(key)
      send_email(@gmail, content, value)
    end
  end
end

#3th method to actually send the mails

def send_email(gmail, body, mail_address)

  body_content = body
  mail_address = mail_address
  gmail = gmail

  gmail.deliver do
    to mail_address

    subject "[Presentation] - The Hacking Project - Formation d'informatique gratuite"
    html_part do
    content_type 'text/html; charset=UTF-8'
    body body_content
  end
    puts "mail sent to #{mail_address}"
    #in order to stay below the 10 mail / sec limit
    sleep(1)

  end
end

def body_content(value)
  value = value
  return "
  <p>Bonjour,</p>
  <p>Je m'appelle Mathieu Brun-Picard et je suis actuellement élève à une formation de code : The Hacking Project (http://thehackingproject.org/).</p>
  <p>Cette formation est gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau.</p>
  <p>Nous apprenons l'informatique en faisant des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes.</p>
  <p>Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.</p>

  <p>Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{value}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.</p>
  <p>Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre d'élèves, donc nous serions ravis de travailler avec #{value} !</p>
  <p>Si vous voulez avoir plus d'information sur la formation, n'hésitez pas à visiter mon blog où je décris le quotidien des étudiants : https://medium.com@mathieu.bp/ </p>

  <p>Si vous avez des questions sur la formation, n'hésitez pas à me recontacter.</p>
  <p>Bien à vous,</p> </br>

  <p>Mathieu Brun-Picard</p>"
end

  #Last Method to combine all the others methods
  def send_email_through_data(gmail)
    gmail = gmail
    read_hash(gmail,read_json)
  end

  def all
    username = ENV['username']
    password = ENV['password']
    gmail = Gmail.connect(username,password)

    send_email_through_data(gmail)
  end
  all
