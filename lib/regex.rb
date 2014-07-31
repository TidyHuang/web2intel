class Regex
	class << self
		def reg_ip; /((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3})/; end
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
		def webins; /\-\-webins/; end
		def tweet; /\-\-twitter/; end
		def mta; /\-\-malware_ta/; end
		def ptank; /\-\-phishtank/; end
	end
end