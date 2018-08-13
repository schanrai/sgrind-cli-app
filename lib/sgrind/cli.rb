class Cli


@@locations_array = []

def call
  #combine two methods below?
  a = Scraper.scrape_index_page
  Event.make_events(a)
  puts "Welcome to the Startup Grind event listings app!"
  start
end


def start
  input = ""
  until input == "3"
  puts ""
  puts "Please select one of the three options listed below"
  puts "To view events by location, enter '1'."
  puts "To view all event listings, enter '2'."
  puts "To quit, enter '3'."
  puts "What would you like to do?"
  input = gets.chomp
    case input
    when "1"
      locations_clear
      view_by_location
    when "2"
      view_by_all_index
    when "3"
      puts "Goodbye!"
    else
      puts "I do not understand - please type '1', '2' or '3' only."
    end
  end
end

def view_by_all_index
  puts "Events happening over the next 6 months:"
  display_event_index
  puts ""
  puts "Enter a number from the numbered list of locations to view details of your selected event:"
  view_event_details_from_all
end

def view_by_location
  puts "Events are happening in the following locations:"
  display_event_locations
  puts ""
  puts 'Enter a number from the numbered list of locations to view events in that city:'
  view_event_by_location
end


def view_event_by_location
  input = gets.chomp
  if (input.to_i >= 1 && input.to_i <= self.locations.size) #why do I need self here? Isn't it obvs we are dealing with the instance?
    location = self.locations[input.to_i - 1]
    result_array = display_events_by_location(location)
    view_event_details_from_loc(result_array)
  else puts "Try again mate" #raise typeError if input not an integer - you have to use location_array.size - this doesn't work properly
  end
end


def view_event_details_from_loc(result) #how to do error correction here for correct for incorrect number that is not in the list
  puts ""
  puts "Enter a number from the numbered list of events to view details of your selected event:"
  input = gets.chomp
  #if (input.to_i >= 1 && input.to_i <= result.size
  event = result[input.to_i - 1]
  event_instance = list_event_details(event)
  display_event_details(event_instance)
end

def view_event_details_from_all
  input = gets.chomp
  if (input.to_i >= 1 && input.to_i <= Event.all.size)
    event_instance = Event.all[input.to_i - 1]
    updated_event = list_event_details(event_instance)
    display_event_details(updated_event)
  else puts "Try again mate"
  end
end



  #reformatted this and put it in cli class from event - but is that correct?
  #call this within cli on event instance chosen by user from location mini-menu/array from fetch_by_location method
  #pass the event instance in as an argument
  #output will be event instance with additional atttributes from details page
  def list_event_details(event)
    url = event.details_link
    event.add_details(Scraper.scrape_details_page(url))
  end


#all the display methods
def display_event_index
  i = 0
  puts ""
  puts "************* All Events *************"
  puts '------------------------------'
  Event.all.each do |event|
    puts "#{i += 1}. #{event.name} | #{event.location}"
  end
  puts '------------------------------'
end


#this needs to take in argument of event object, will come from the event.all[index_number]
#speakers turning from string to array line 18 is untested
def display_event_details(event)
    x = event.speakers * ", "
    puts ""
    puts "************* Event Details *************"
  puts '------------------------------'
    puts "Title: #{event.name}"
    puts "Date: #{event.date}"
    puts "Location: #{event.location}"
    puts "Category: #{event.event_type}"
    puts "Description: #{event.long_descrip}"
    puts "Speakers: #{x}"
    puts "Time: #{event.start_time}"
    puts "Address: #{event.address}"
    puts '------------------------------'
end



#location mini-menu
def display_events_by_location(location)
 #use Event.fetch_by_location(location)
 y = 0
 d = Event.fetch_by_location(location)
 puts ""
 puts "************* Events In Your Location *************" #lazy but too hungover and short on time to do the string interpolation thingy
 d.each do| event |
 puts "#{y += 1}. #{event.name}"
 end
end



def display_event_locations
  i = 0
  d = Event.list_locations
  puts ""
  puts "************* Event Locations *************"
  d.each do|location|
  @@locations_array << location #you need this for fetch_by_location
  puts "#{i += 1}. #{location}"
  end
end


#you need this for fetch_by_location
  def locations
    @@locations_array
  end

  def locations_clear
    @@locations_array.clear
  end



end
