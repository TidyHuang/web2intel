#!/usr/bin/env ruby
require 'rss'
require 'open-uri'
require 'optparse'
require 'nokogiri'

time = Time.new

commands = []
ARGV.each {|arg| commands << arg}

class Msg
	class << self
		def url_option; "The --url option is not available for this report..."; end
		def time; Time.new; end
		def time_head; "#"+time.inspect; end
	end
end

class Urls
	class << self
		def sslbl_url; 'https://sslbl.abuse.ch/sslbl.rss'; end
		def quttera_mal_url; 'http://quttera.com/lists/malicious'; end
		def quttera_sus_url; 'http://quttera.com/lists/suspicious'; end
		def quttera_potsus_url; 'http://quttera.com/lists/potentially_suspicious'; end
		def goz; 'http://osint.bambenekconsulting.com/feeds/goz-domlist.txt'; end
		def mwdoms; 'http://mirror1.malwaredomains.com/files/domains.txt'; end
		def isc_low_url; 'https://isc.sans.edu/feeds/suspiciousdomains_Low.txt'; end
		def isc_med_url; 'https://isc.sans.edu/feeds/suspiciousdomains_Medium.txt'; end
		def isc_high_url; 'https://isc.sans.edu/feeds/suspiciousdomains_High.txt'; end
		def sucuri_url; 'http://labs.sucuri.net/?malware'; end
	end
end

class Regex
	class << self
		def url_option; /\-\-url/; end
		def reg; /([a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6})\b/; end # regex for [host].[domain].[tld] only
		def reg_url; /(.+)/; end	# sloppy regex to grab the URL
		def reg_url2; /(.+)\//; end	# sloppy regex to grab the URL
		def reg_fp; /src\=\"(.+)/; end
		def reg_redir; /redirections(.+)/; end
		def reg_spam; /spammer(.+)/; end
		def reg_js; /javascript(.+)/; end
		def reg_if; /iframe(.+)/; end
		def leading; /src\=\"/; end
		def leading_js; /.+\"http/; end
		def trailing; /\".+/; end
		def sslbl; /\-\-sslbl/; end
		def qmal; /\-\-q\_mal/; end
		def qsus; /\-\-q\_sus/; end
		def qpot; /\-\-q\_pot/; end
		def details; /\-\-details/; end
		def goz; /\-\-goz/; end
		def mwdoms; /\-\-mwdoms/; end
		def common_name; /Common Name/; end
		def lhost; /localhost/; end
		def c_equals; /C=/; end
		def domain; /\[Domain\]\:/; end
		def isc_low; /\-\-isc\_low/; end
		def isc_med; /\-\-isc\_med/; end
		def isc_high; /\-\-isc\_high/; end
		def sucuri_iframe; /\-\-sucuri\_iframe/; end
		def sucuri_redirect; /\-\-sucuri\_redirect/; end
		def sucuri_spam; /\-\-sucuri\_spam/; end
		def sucuri_js; /\-\-sucuri\_js/; end
		def all; /\-\-all/; end
	end
end

if ARGV[0] =~ Regex.sslbl
	if ARGV[1] != nil
		puts Msg.url_option
	else open(Urls.sslbl_url) do |rss|
	  feed = RSS::Parser.parse(rss)
	  puts "#Title: #{feed.channel.description}"
	  puts Msg.time_head
	  feed.items.each do |item|
	  	if "#{item.description}" =~ (Regex.common_name && Regex.reg) && "#{item.description}" !~ (Regex.lhost || Regex.c_quals)
			puts Regex.reg.match("#{item.description}")
		end
	  end
	end
end


elsif ARGV[0] =~ Regex.qmal
	page = Nokogiri::HTML(open(Urls.quttera_mal_url))
	puts "#Title: Quttera Malicious Domains Database"
	puts Msg.time_head
	page.xpath('//table[1]').each do |cell|
		if ARGV[1] =~ Regex.url_option
			puts Regex.reg_url.match("#{cell.text.strip}").to_s.gsub(Regex.domain, "")

   		elsif ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		else puts Regex.reg.match("#{cell.text.strip}")
   		end
	end

elsif ARGV[0] =~ Regex.qsus
	page = Nokogiri::HTML(open(Urls.quttera_sus_url))
	puts "#Title: Quttera Suspicious Domains Database"
	puts Msg.time_head
	page.xpath('//table[1]').each do |cell|
		if ARGV[1] =~ Regex.url_option
			puts Regex.reg_url.match("#{cell.text.strip}").to_s.gsub(Regex.domain, "")

   		elsif ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		else puts Regex.reg.match("#{cell.text.strip}")
   		end
	end

elsif ARGV[0] =~ Regex.qpot
	page = Nokogiri::HTML(open(Urls.quttera_potsus_url))
	puts "#Title: Quttera Potentially Suspicious Domains Database"
	puts Msg.time_head
	page.xpath('//table[1]').each do |cell|
		if ARGV[1] =~ Regex.url_option
			puts Regex.reg_url.match("#{cell.text.strip}").to_s.gsub(Regex.domain, "")
   		elsif ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		else puts Regex.reg.match("#{cell.text.strip}")
   		end
	end

elsif ARGV[0] =~ Regex.goz
	page = Nokogiri::HTML(open(Urls.goz))
	puts "#Gameover Zeus Domain List"
	puts Msg.time_head
	page.xpath('//p').each do |cell|
   		if ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		else "#{cell.text.strip}" != "\#"
   		 puts Regex.reg.match("#{cell.text.strip}")
   		end
	end	

elsif ARGV[0] =~ Regex.mwdoms
	puts "#DNS-BH – Malware Domain Blocklist"
	puts Msg.time_head
	open(Urls.mwdoms)  {|f|
  		f.each_line {|line| puts Regex.reg.match("#{line}")}}

elsif ARGV[0] =~ Regex.isc_low
	puts "#SANS Internet Storm Center LOW confidence block list"
	puts Msg.time_head
	page = open(Urls.isc_low_url)
	page.each do |f|
		f.each_line do |line|
			unless line =~ /\#/
				unless line =~ /Site/
					puts line
				end
			end
		end
	end

elsif ARGV[0] =~ Regex.isc_med
	puts "#SANS Internet Storm Center MEDIUM confidence block list"
	puts Msg.time_head
	page = open(Urls.isc_med_url)
	page.each do |f|
		f.each_line do |line|
			unless line =~ /\#/
				unless line =~ /Site/
					puts line
				end
			end
		end
	end

elsif ARGV[0] =~ Regex.isc_high
	puts "#SANS Internet Storm Center HIGH confidence block list"
	puts Msg.time_head
	page = open(Urls.isc_high_url)
	page.each do |f|
		f.each_line do |line|
			unless line =~ /\#/
				unless line =~ /Site/
					puts line
				end
			end
		end
	end

elsif ARGV[0] =~ Regex.sucuri_iframe
	page = Nokogiri::HTML(open(Urls.sucuri_url))
	puts "#Title: Sucuri Research Labs Hidden iframes list"
	puts Msg.time_head
	page.xpath('//table[1]//tr').each do |cell|
		if ARGV[1] =~ Regex.url_option
			if Regex.reg.match("#{cell.text.strip}") != nil
				puts Regex.reg_if.match("#{cell.text.strip}").to_s.gsub("iframe", "")
			end
   		elsif ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		elsif Regex.reg_if.match("#{cell.text.strip}") != nil
     		rep = Regex.reg_if.match("#{cell.text.strip}").to_s.gsub("iframehttp://", "")
     		unless rep =~ /index/
     			puts Regex.reg.match(rep)
     		end
   		end
	end

elsif ARGV[0] =~ Regex.sucuri_redirect
	page = Nokogiri::HTML(open(Urls.sucuri_url))
	puts "#Title: Sucuri Research Labs Redirect list"
	puts Msg.time_head
	page.xpath('//table[2]//tr').each do |cell|
		if ARGV[1] =~ Regex.url_option
			if Regex.reg_redir.match("#{cell.text.strip}") != nil
				puts Regex.reg_redir.match("#{cell.text.strip}").to_s.gsub("redirections", "")
			end
   		elsif ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		elsif Regex.reg.match("#{cell.text.strip}") != nil  
   			puts Regex.reg.match("#{cell.text.strip}")
   		end
	end

elsif ARGV[0] =~ Regex.sucuri_js
	page = Nokogiri::HTML(open(Urls.sucuri_url))
	puts "#Title: Sucuri Research Labs JavaScript list"
	puts Msg.time_head
	page.xpath('//table[3]//tr').each do |cell|
		if ARGV[1] =~ Regex.url_option
			if Regex.reg_js.match("#{cell.text.strip}") != nil
				puts Regex.reg_js.match("#{cell.text.strip}").to_s.gsub(Regex.leading_js, "")#.gsub(Regex.trailing, "")
			end
   		elsif ARGV[1] =~ Regex.details
   			puts "#{cell.text.strip}"
   		elsif Regex.reg.match("#{cell.text.strip}") != nil  
   			puts Regex.reg.match("#{cell.text.strip}")
   		end
	end

elsif ARGV[0] =~ Regex.all
	puts "Not yet implemented..."
	
else puts "Invalid command...

	./web2intel.rb <option> <extras>

	<option>
	--sslbl 			- The abuse.ch SSL block list
	--q_mal 			- The Quttera malicious domains database
	--q_sus 			- The Quttera suspicious domains database
	--q_pot 			- The Quttera potentially suspicious database
	--goz 				- Gameover Zeus list
	--mwdoms 			- DNS-BH – Malware Domain Blocklist
	--isc_low			- SANS Internet Storm Center LOW confidence block list
	--isc_med			- SANS Internet Storm Center MEDIUM confidence block list
	--isc_high			- SANS Internet Storm Center HIGH confidence block list
	--sucuri_iframe		- Sucuri scanner identified iframe compromised web site list
	--sucuri_redirect	- Sucuri scanner identified conditional redirections list (based on user agents or referers)
	--sucuri_js			- Sucuri scanner identified encoded javascript (redirecting to blackhole and other exploit kits) or to build a remote call list

	--all 		- Generate a master list of all domains

	<extras>
	--url		- Extract the fully quaified domain name (FQDN), protocol, port, and directory structure (if available)
	--details	- Addtional inline details

	[Example]
	./web2intel.rb --q_mal --url

	(C) Andrew Hay, 2014
	"
end