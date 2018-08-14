class Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("https://www.startupgrind.com/events/"))
    scraped_index = []
    doc.css("#upcoming-events .panel-picture-content").each do |events|
    scraped_index << {:name => events.css("h4").text,
    :event_type => events.css("h5").text,
    :short_descrip => events.css("p.description").text,
    :location => events.css("a.chapter-link").text,
    :location_link => events.css(".date a").attribute("href").value,
    :details_link => events.css("a")[1].attribute("href").value,
    :date => events.css(".date").text.split("- ")[0].strip}
    end
    scraped_index
  end

  #will take in the argument of a details_link from Event.fetch_details_url(event_id)
  def self.scrape_details_page(url)
    scraped_details = {}
    doc = Nokogiri::HTML(open(url))
    scraped_details[:long_descrip] = doc.css(".event-description").text.strip
    scraped_details[:start_time] = doc.at(".container-inner .agenda-item strong").text
    scraped_details[:address] = doc.at(".container-inner//span[@itemprop = 'name']").children.text + ", " +
      doc.at(".container-inner//span[@itemprop = 'streetAddress']").children.text + ", " +
      doc.at(".container-inner//span[@itemprop = 'addressLocality']").children.text + ", " +
      doc.at(".container-inner//span[@itemprop = 'postalCode']").children.text
    scraped_details[:speakers] = doc.css(".event-speaker-list//h2[@itemprop = 'name']").map {|y| y.children.text.strip}
    scraped_details
    end



end
