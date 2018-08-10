class Cli

@@locations_array = []

=begin
def display_event_index
Student.all.each do |student|
  puts "#{student.name.upcase}".colorize(:blue)
  puts "  location:".colorize(:light_blue) + " #{student.location}"
  puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
  puts "  bio:".colorize(:light_blue) + " #{student.bio}"
  puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
  puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
  puts "  github:".colorize(:light_blue) + " #{student.github}"
  puts "  blog:".colorize(:light_blue) + " #{student.blog}"
  puts "----------------------".colorize(:green)
  end
end

def display_event_details

end

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
