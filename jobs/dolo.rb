require 'net/http'
require 'uri'
require 'nokogiri'
require 'htmlentities'
require 'pry'
require 'open-uri'
require 'icalendar'


class DoloEvents
  DOLO_ICAL = "https://www.google.com/calendar/ical/6ba5qum6cd5dve87s28i14g6p4%40group.calendar.google.com/private-7a8b2adba8e38eeb218a14ebab38a3da/basic.ics"
  def upcoming
  end
  def today
    events.select do |event|
      p [event.dtstart, event.dtend]
      event.dtstart > DateTime.now > event.dtend
    end
  end

  def calendar
    Icalendar.parse(open(DOLO_ICAL)).first
  end

  def events
    calendar.events
  end
end

p DoloEvents.new.today

#SCHEDULER.every '60m', :first_in => 0 do |job|
#  @News.each do |news|
#    headlines = news.latest_headlines()
#    send_event(news.widget_id, { :headlines => headlines })
#  end
#end
