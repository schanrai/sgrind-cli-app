class Event
  attr_accessor :name, :event_type, :short_descrip, :location, :location_link, :details_link, :date, :long_descrip, :start_time, :address, :speakers

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

 #needs to be called on an event instance and takes in a hash from the Scraper > scrape_details_page(url) method
  def add_details(scraped_details)
    scraped_details.each do |attr, value|
      self.send("#{attr}=", value)
    end
   self
  end


  def self.list_locations
    self.all.map do | event|
      event.location
    end.uniq.sort
  end


  #argument will be a single string location eg. "Tbilisi,GE" which is a result of CLI.locations[locations_array_index]
  #output will be array of event objects that match query
  def self.fetch_by_location(location)
    self.all.select {|event| event.location == location}
  end


  #fetches event details_link by event id
  def self.fetch_details_url(event_id)
    self.all[event_id].details_link
  end

  #input will be array from fetch_by_location method
  def self.list_event_details_by_location(filtered_event_array)
    filter_deets_urls = filtered_event_array.map {| element | element.details_link}
    c = filter_deets_urls.each { |url| Scraper.scrape_details_page(url) }
    binding.pry
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
