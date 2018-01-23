require 'google_drive'
require 'json'
require 'pry'

class Write_Spreadsheet

  def initialize
    # Creates a session.
    session = GoogleDrive::Session.from_config("config.json")
    @ws = session.spreadsheet_by_key("19xK0X2sOwQ6Om4rTlQWMDZwlrNTTu2jWg-q60r10pu0").worksheets[0]
    (1..@ws.num_rows).each do |row|
      (1..@ws.num_cols).each do |col|
       @ws[row, col] = ""
     end
   end
   @ws.save
 end

  #Method to save the values on the drive
  def go_through_hash(my_hash)

    puts "Writing all the values on Google Drive"
    puts "====================================================================="
    i = 1
    @my_hash = my_hash
    @my_hash.each do |key, value|
      @ws[i,1] = key
      @ws[i,2] = value
      i = i + 1
    end
    puts "====================================================================="
    puts "Writed all the values on Google Drive"
    @ws.save
  end

  #Method to write a hash in JSON

  def self.write_json(my_hash)
    my_hash = my_hash
    File.open("townhall.json","w") do |f|
      f.write(my_hash.to_json)
    end
  end

  def self.gothrough_json
    file = File.read('townhall.json')
    jason = JSON.parse(file)
    return jason
  end

  def self.spreadsheet_writing
    scrapping_hash = {}
    instance = Write_Spreadsheet.new
    scrapping_hash = instance.go_through_hash(self.gothrough_json)
  end

end




