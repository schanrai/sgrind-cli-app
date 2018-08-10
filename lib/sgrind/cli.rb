class Cli

@@locations_array = []

#test all the display methods
def display_event_index
  i = 0
  Event.all.each do |event|
    puts '------------------------------'
      puts "#{i += 1}. #{event.name}"
    puts '------------------------------'
  end
end

#this needs to take in argument of event object, will come from the event.all[index_number]
def display_event_details(event)
  puts '------------------------------'
    puts "Title: #{event.name}"
    puts "Location: #{event.location}"
    puts "Category: #{event.event_type}"
    puts "Description: #{event.long_descrip}"
    puts "Speakers: #{event.speakers}"
    puts "Date: #{event.date}"
    puts "Time: #{event.start_time}"
    puts "Address: #{event.address}"
    puts '------------------------------'
end


=begin
def display_events_by_location
 #use Event.fetch_by_location(location)
end

=end



def self.display_event_locations
  i = 0
  d = Event.list_locations
  d.each do|location|
  @@locations_array << location
  puts "#{i += 1}. #{location}"
  end
end


  def self.locations
    @@locations_array
  end



end
