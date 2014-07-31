class Urls
	class << self
		def sslbl_url; 'https://sslbl.abuse.ch/sslbl.rss'; end
		def malware_ta; 'http://www.malware-traffic-analysis.net/blog-entries.rss'; end
		def quttera_mal_url; 'http://quttera.com/lists/malicious'; end
		def quttera_sus_url; 'http://quttera.com/lists/suspicious'; end
		def quttera_potsus_url; 'http://quttera.com/lists/potentially_suspicious'; end
		def goz; 'http://osint.bambenekconsulting.com/feeds/goz-domlist.txt'; end
		def mwdoms; 'http://mirror1.malwaredomains.com/files/domains.txt'; end
		def isc_low_url; 'https://isc.sans.edu/feeds/suspiciousdomains_Low.txt'; end
		def isc_med_url; 'https://isc.sans.edu/feeds/suspiciousdomains_Medium.txt'; end
		def isc_high_url; 'https://isc.sans.edu/feeds/suspiciousdomains_High.txt'; end
		def sucuri_url; 'http://labs.sucuri.net/?malware'; end
		def webins_url; 'http://app.webinspector.com/public/recent_detections'; end
		def phishtank; 'http://data.phishtank.com/data/online-valid.json'; end
	end
end