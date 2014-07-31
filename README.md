web2intel
=========

###About

Script to fetch malicious domain and URL lists from sites that publish RSS feeds or raw HTML pages.

###Usage

	./web2intel.rb <option> <extras>

	<option>
	--sslbl 			- The abuse.ch SSL block list
	--q_mal 			- The Quttera malicious domains database
	--q_sus 			- The Quttera suspicious domains database
	--q_pot 			- The Quttera potentially suspicious database
	--goz 				- Gameover Zeus list
	--mwdoms 			- DNS-BH – Malware Domain Blocklist
	--malware_ta		- Malware-Traffic-Analysis.net domains
	--isc_low			- SANS Internet Storm Center LOW confidence block list
	--isc_med			- SANS Internet Storm Center MEDIUM confidence block list
	--isc_high			- SANS Internet Storm Center HIGH confidence block list
	--sucuri_iframe		- Sucuri scanner identified iframe compromised web site list
	--sucuri_redirect	- Sucuri scanner identified conditional redirections list (based on user agents or referers)
	--sucuri_js			- Sucuri scanner identified encoded javascript (redirecting to blackhole and other exploit kits) or to build a remote call list
	--webins 			- Comodo Web Inspector malicious, suspicious content, and malware site list
	--twitter			- Twitter username (e.g. andrewsmhay). Do not prepend the '@' symbol

	--all 		- Generate a master list of all domains

	<extras>
	--url		- Extract the fully quaified domain name (FQDN), protocol, port, and directory structure (if available)
	--details	- Addtional inline details

	(C) Andrew Hay, 2014
	http://www.andrewhay.ca
	https://twitter.com/andrewsmhay

####Example 1 - Domains only

	$ ./web2intel.rb --sucuri_iframe
	#Title: Sucuri Research Labs Hidden iframes list
	#2014-07-20 15:08:14 -0700
	ads.rzb.ir
	www.scs.tv
	gvlktdfay.ddns.info
	38hartrobertsroad.com
	www.bmconsulting.in
	niu-sae.com
	pgcsolutions.com.au
	sterlinghealthmcs.com
	gamedev.raconsultants.net
	billing.zabiyaka.org
	orion.martasegura.com
	nioxox.nodoclender.com
	joomla.philae.net
	it.altervista.org
	guessworkhiking.ru
	1tvlive.in

####Example 2 - Full URLs

	$ ./web2intel.rb --sucuri_iframe --urls
	#Title: Sucuri Research Labs Hidden iframes list
	#2014-07-20 15:08:42 -0700
	http://ads.rzb.ir/image.php?size_id=7
	http://www.scs.tv/wp-content/themes/twentyeleven/colors/update.php
	http://gvlktdfay.ddns.info/nighttrend.cgi?8
	http://38hartrobertsroad.com/wp-content/plugins/rotr
	http://www.bmconsulting.in/
	http://niu-sae.com/stats.php
	http://pgcsolutions.com.au/pRN9XvYP.php
	http://sterlinghealthmcs.com/go.php\
	http://gamedev.raconsultants.net/ok.php
	http://billing.zabiyaka.org/?2
	http://orion.martasegura.com/configuration.php
	http://nioxox.nodoclender.com:13014/poll/novell.php?rssfeed=41
	http://joomla.philae.net/blog.php
	http://it.altervista.org/group/child_blog.php?group=6
	http://guessworkhiking.ru/maxstacksizedetracted.cgi?8
	http://1tvlive.in/embed/main.php
	http://129.121.235.130/Home/index.php

####Example 3 - Details
	$ ./web2intel.rb --q_mal --details
	#Title: Quttera Malicious Domains Database
	#2014-07-22 08:02:36 -0700
	[Domain]:http://mell.hu:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 14:52:52 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://biopure.in:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 14:33:20 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://mmadawgs.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 14:16:55 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website

####Example 4 - Twitter
	$ ./web2intel.rb --twitter InternetBadness
	#Title: Twitter-based intel from twitter.com/InternetBadness
	#2014-07-25 09:08:18 -0700
	93.174.93.218
	74.82.47.53
	218.77.79.43
	199.87.232.182
	74.82.47.5
	93.174.93.218
	212.83.187.182
	212.83.187.182
	218.77.79.43
	93.174.93.218
	31.214.169.85
	31.214.169.85
	74.82.47.61
	124.232.142.220
	173.208.186.130
	173.208.186.130
	107.183.16.70
	107.183.16.70
	218.77.79.43
	74.82.47.57

####Example 5 - Twitter Details
	$ ./web2intel.rb --twitter InternetBadness --details
	#Title: Twitter-based intel from twitter.com/InternetBadness
	#2014-07-25 09:09:07 -0700
	10:23:49.0823 93.174.93.218-&gt;HPKMKE02:21320-ET DROP Dshield Block Listed Source group 1
	10:49:47.7372 74.82.47.53-&gt;HPKCAK01:17-ET DROP Dshield Block Listed Source group 1
	10:28:54.0085 218.77.79.43-&gt;HPKCAK01:443-ET DROP Dshield Block Listed Source group 1
	11:11:48.1173 199.87.232.182-&gt;HPKLAX01:1080-ET CINS Active Threat Intelligence Poor Reputation IP TCP group 35
	10:55:54.5286 74.82.47.5-&gt;HPKLAX01:17-ET DROP Dshield Block Listed Source group 1
	10:22:08.2686 93.174.93.218-&gt;HPKLAX01:21320-ET DROP Dshield Block Listed Source group 1
	10:20:03.1186 212.83.187.182-&gt;HPKLAX01:5060-ET SCAN Sipvicious Scan
	10:20:03.1186 212.83.187.182-&gt;HPKLAX01:5060-ET SCAN Sipvicious User-Agent Detected (friendly-scanner)
	10:40:06.9590 218.77.79.43-&gt;HPKBUF01:8080-ET DROP Dshield Block Listed Source group 1
	10:27:09.9757 93.174.93.218-&gt;HPKBUF01:21320-ET DROP Dshield Block Listed Source group 1
	10:16:07.3205 31.214.169.85-&gt;HPKBUF01:5060-ET SCAN Sipvicious Scan
	10:16:07.3205 31.214.169.85-&gt;HPKBUF01:5060-ET SCAN Sipvicious User-Agent Detected (friendly-scanner)
	10:04:44.5817 74.82.47.61-&gt;HPKBUF01:17-ET DROP Dshield Block Listed Source group 1
	10:04:59.0997 124.232.142.220-&gt;HPKCAK01:53-ET DROP Dshield Block Listed Source group 1
	09:46:30.1326 173.208.186.130-&gt;HPKCAK01:5060-ET SCAN Sipvicious Scan
	09:46:30.1326 173.208.186.130-&gt;HPKCAK01:5060-ET SCAN Sipvicious User-Agent Detected (friendly-scanner)
	09:19:29.3871 107.183.16.70-&gt;HPKCAK01:5060-ET SCAN Sipvicious Scan
	09:19:29.3871 107.183.16.70-&gt;HPKCAK01:5060-ET SCAN Sipvicious User-Agent Detected (friendly-scanner)
	09:31:33.6652 218.77.79.43-&gt;HPKLAX01:443-ET DROP Dshield Block Listed Source group 1
	09:45:48.2193 74.82.47.57-&gt;ROLROP01:17-ET DROP Dshield Block Listed Source group 1

###Support

For any questions, bugs, or concerns, please use the GitHub issue submission system and/or reach out to @andrewsmhay on Twitter.

(C) Andrew Hay, 2014