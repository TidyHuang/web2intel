web2intel
=========

###About

Script to fetch malicious domain and URL lists from sites that publish RSS feeds or raw HTML pages.

###Supported Lists

* The <a href="https://sslbl.abuse.ch/sslbl.rss">Abuse.ch SSL block list</a>
* The Quttera <a href="http://quttera.com/lists/malicious">malicious</a>, <a href="http://quttera.com/lists/suspicious">suspicious</a>, and <a href="http://quttera.com/lists/suspicious">potentially suspicious</a> domains database
* <a href="http://osint.bambenekconsulting.com/manual/goz-domlist.txt">John Bambenek's</a> <a href="http://osint.bambenekconsulting.com/feeds/goz-domlist.txt">Gameover Zeus list</a>
* DNS-BH – <a href="http://mirror1.malwaredomains.com/files/domains.txt">Malware Domain Blocklist</a>
* SANS Internet Storm Center <a href="https://isc.sans.edu/feeds/suspiciousdomains_Low.txt">LOW</a>, <a href="https://isc.sans.edu/feeds/suspiciousdomains_Medium.txt">MEDIUM</a>, and <a href="https://isc.sans.edu/feeds/suspiciousdomains_High.txt">HIGH</a> confidence block lists
* Sucuri Security's scanner <a href="http://labs.sucuri.net/?malware">identified iframe, conditional redirection, and encoded javascript web site list</a>
* <a href="http://app.webinspector.com/public/recent_detections">Comodo Web Inspector</a> contains some of websites which host malicious, suspicious content and malware files. It is updated every 60 mins. 

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
	--webins 			- Comodo Web Inspector malicious, suspicious content, and malware site list


	--all 		- Generate a master list of all domains

	<extras>
	--url		- Extract the fully qualified domain name (FQDN), protocol, port, and directory structure (if available)
	--details	- Additional (often original data format) details

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
	[Domain]:http://adaklikkoyunfiyatlari.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:46:52 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://dancersbook.net:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:35:05 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://naghersamajhospital.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:18:17 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://downloadscenter.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:15:14 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://realgames.pt:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:14:48 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://andriussprindys.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:12:07 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://schgt.cn:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:10:41 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://darks.hotmail.ru:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 13:06:17 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://vacurect.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 12:40:52 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://isecurity.info:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 12:34:48 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://hovawarte-vom-ostertal.de:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 12:26:41 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://www.cominet.co.kr:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 11:41:06 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://butchnlucy.com:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 11:16:35 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://nikom.in:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 11:13:08 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://haliax.in:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 11:05:12 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://av-tek.in:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 11:03:03 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website
	[Domain]:http://aifs.in:80
	                                [Type]:malicious
	                                [Time]:Tue Jul 22 11:00:16 2014
	                                [Report]:View website scan report
	                                [Anti malware monitoring]:Start monitoring this website

###Support

For any questions, bugs, or concerns, please use the GitHub issue submission system and/or reach out to @andrewsmhay on Twitter.

(C) Andrew Hay, 2014