web2intel
=========

###About

Script to fetch RSS feeds and raw HTML pages to write out IP and domain data.

###Usage

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
	$ <em>./web2intel.rb --q_mal --url$ ./web2intel.rb --q_mal --url</em>
	#Title: Quttera Malicious Domains Database
	#2014-07-20 14:53:55 -0700
	http://www.polipak.rs:80
	http://me1.in:80
	http://xsr-ro.eu:80
	http://pokezot.ddnsking.com:80
	http://demo.ovh.eu:80
	http://www.clearprog.de:80
	http://www.zorrospen.com:80
	http://www.falcondns.com:80
	http://www.shopurbain.com:80
	http://www.youareanidiot.org:80
	http://www.zahf.de:80
	http://www.ttbcbd.com:80
	http://shutter-bug.net:80
	http://thewini.net:80
	http://bigfootevidence.blogspot.de:80
	http://travel.spotcoolstuff.com:80
	http://d-carauto.blogspot.nl:80
	http://www.facegotours.com:80
	http://dragosnicu.ro:80
	http://www.pasadayiogullari.com.tr:80

###Support

For any questions, bugs, or concerns, please use the GitHub issue submission system and/or reach out to <a href="twitter.com/andrewsmhay">@andrewsmhay</a> on Twitter.

(C) Andrew Hay, 2014