require 'rubygems'
require 'bundler/setup'
require 'csv'

Bundler.require(:default)


#First read the numbers to track from tracklist
to_track = []
File.open('to_track.list').each do |line|
	to_track << line.to_i
end

events = []
to_track.each do | e_num|
	events << Stubhub::Event.find_by_event_id(e_num)
end

events.each do | ev |
	CSV.open("logs/all.csv", "a") do |csv|
		csv << [ev.id, ev.title_en_US, ev.minPrice, ev.maxPrice, ev.event_date, ev.date_added]
	end
end


