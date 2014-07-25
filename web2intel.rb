#!/usr/bin/env ruby
require 'rss'
require 'open-uri'
require 'optparse'
require 'nokogiri'
require 'twitter'
require './lib/creds.rb'
require './lib/urls.rb'
require './lib/regex.rb'
require './lib/msg.rb'

time = Time.new

commands = []
ARGV.each {|arg| commands << arg}

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

elsif ARGV[0] =~ Regex.webins
	page = Nokogiri::HTML(open(Urls.webins_url))
	puts "#Title: Web Inspector Unsafe Site list"
	puts Msg.time_head
	page.xpath('//table[1]//tr').each do |cell|
		if Regex.reg.match("#{cell.text.strip}") != nil  
   			puts Regex.reg.match("#{cell.text.strip}")
   		end
	end

elsif ARGV[0] =~ Regex.tweet
	if ARGV[1] != nil
		puts "#Title: Twitter-based intel from twitter.com/#{ARGV[1]}"
		puts Msg.time_head
		if ARGV[2] =~ Regex.details
			Tweets.client.user_timeline("#{ARGV[1]}").each do |t|
				if "#{t.text}" != nil
					puts "#{t.text}"
				end
			end
		else
			Tweets.client.user_timeline("#{ARGV[1]}").each do |t|
				if Regex.reg_ip.match("#{t.text}") != nil
					puts Regex.reg_ip.match("#{t.text}")
				end
			end
		end
end

elsif ARGV[0] =~ Regex.all
	puts "Not yet implemented..."
	
else puts Msg.invalid
end