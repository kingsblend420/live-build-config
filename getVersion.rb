#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

begin
	# Grab Kali Release Page At http://www.kali.org/kali-linux-releases/
	html = Nokogiri::HTML(open('http://www.kali.org/kali-linux-releases/'))

	# Filter out last entry in Release-List
	rlist = html.css('div.entry li')
	entry = rlist[rlist.length-1]

	if(entry.text =~ /^Kali\s([0-9]{1,})(.[0-9]{1,})(.[0-9])*/)
		$~.captures.each do |cap|
			print cap
		end
		print "\n"
	end

rescue Exception => e
	puts e.message
	abort
end
