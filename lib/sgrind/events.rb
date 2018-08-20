class Event
  attr_accessor :name, :event_type, :short_descrip, :location, :location_link, :details_link, :date, :long_descrip, :start_time, :address, :speakers

  @@all = []

  def initialize(event_hash)
    event_hash.each do |k, v|
      self.send("#{k}=", v)
      end
    save
  end

  def self.make_events(scraped_index)
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


  #call this within cli on event instance chosen by user from location mini-menu/array from fetch_by_location method
  #pass the event instance in as an argument
  #output will be event instance with additional atttributes from details page
  def get_event_details
    if self.long_descrip
      return self
    else
    url = self.details_link
    self.add_details(Scraper.scrape_details_page(url))
    end
  end


  def self.all
      @@all
  end

  def save
    @@all << self
  end


end
