require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'
require 'pp'

module Scrapping_module
  class Scrapping

    def get_all_the_urls_of_France(url, number)
      @user_zip = number
      @url = url
      table_region = []
      page = Nokogiri::HTML(open(@url))
      nom_region = page.xpath("//a[@class = 'lientxt']")

      nom_region.each do |link|

        if link["title"][0..1] == @user_zip
          region_url = "http://annuaire-des-mairies.com/" + link["href"]
          table_region << region_url
        end
      end

      return table_region

    end

    def get_all_the_urls_of_region_townhalls(array)
      @url_array = array
      table_link = {}
      @url_array.each do |region|
        @page = Nokogiri::HTML(open(region))
      end

      @region_pages = []
      @page.xpath("//center/p/a").each do |value|
        @region_pages << "http://annuaire-des-mairies.com/" + value["href"]
      end
      if @region_pages.empty?
        @region_pages << @url_array[0]
      end
      @region_pages.each do |link|
        page = Nokogiri::HTML(open(link))
        nom_ville = page.xpath("//a[@class = 'lientxt']")

        nom_ville.each do |link|

          unless link["href"][0] == "."

            townhall_url = "http://annuaire-des-mairies.com/" + link["href"]
            table_link[link.text.capitalize] = townhall_url
          else
           townhall_url = "http://annuaire-des-mairies.com" + link["href"][1..-1]
           table_link[link.text.capitalize] = townhall_url
         end
       end
     end
     return table_link
   end

   def get_the_email_of_a_townhal_from_its_webpage(hash)
    my_hash = {}
    @url_hash= hash
    i = 0
      #Boucle sur chacun des liens obtenu sur le site des mairies du val d'oise
      @url_hash.each do |key, value|
        begin
          page = Nokogiri::HTML(open(value))
        rescue OpenURI::HTTPError => e
          puts "issue with #{key}"
        end

        unless page == nil

          unless  page.xpath("//p[@class = 'Style22']")[11] == nil
            begin
              mail_table = page.xpath("//p[@class = 'Style22']")[11].text
              my_hash[key] = mail_table[1..-1]
            rescue NoMethodError
              puts "issue with #{key}"
              binding.pry
           end
          else
            begin
              mail_table = page.xpath("//tr[@class = 'txt-primary tr-last'][4]/td[2]")[0].text
              my_hash[key] = mail_table
            rescue NoMethodError
              puts "issue with #{key}"
              binding.pry
            end
          end
        else
        #if there is an issue with the link display this message
        #and dont add a email address
        puts "No page for #{key}"
        my_hash[key] = ""
      end

      i = i +1

      if i%500 == 0
        puts i
      end

    end


    return my_hash

  end
  def write_json(my_hash)
    my_hash = my_hash

    File.open("townhall.json","w") do |f|
      f.write(my_hash.to_json)
    end
  end
  def all

    user_input = "http://annuaire-des-mairies.com/"
    puts "What is the department number you want to scrap ? [01-95 or 971-4]"
    user_number = gets.chomp

    scrapper = Scrapping_module::Scrapping.new

    unless user_input.empty?

      my_regionarray = scrapper.get_all_the_urls_of_France(user_input,user_number)
      my_city_hash = scrapper.get_all_the_urls_of_region_townhalls(my_regionarray)
      puts "Here you go"
      puts "==========================================================================================="

       my_data_hash = scrapper.get_the_email_of_a_townhal_from_its_webpage(my_city_hash)
        write_json(my_data_hash)
    else
      puts "So you don't want to scrap. Bye"
    end
  end
end
end



