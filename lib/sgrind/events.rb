class Event
  attr_accessor :name, :event_type, :short_descrip, :location, :location_link, :details_link, :date, :long_descrip, :time, :address, :speakers

  @@all = []

  def initialize(event_hash)
    event_hash.each do |k, v|
      self.send("#{k}=", v)
      end
    save
    #self
  end

  def self.make_events(scraped_index)
     #self.clear
     scraped_index.each do |event_hash|
       Event.new(event_hash)
     end
  end

   def add_details(scraped_details)
     scraped_details.each do |attr, value|
       self.send("#{attr}=", value)
     end
    self
   end


  def self.all
      @@all
  end


  def save
    @@all << self
  end


  def self.clear
      @@all.clear
  end

end
