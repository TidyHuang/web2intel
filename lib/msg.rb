class Msg
	class << self
		def url_option; "The --url option is not available for this report..."; end
		def time; Time.new; end
		def time_head; "#"+time.inspect; end
		def invalid
			"
Invalid command...

[Usage]
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
--twitter			- Twitter username (e.g. andrewsmhay). Do not prepend the '@' symbol

--all 		- Generate a master list of all domains

<extras>
--url		- Extract the fully quaified domain name (FQDN), protocol, port, and directory structure (if available)
--details	- Addtional inline details

[Examples]
./web2intel.rb --q_mal --url
./web2intel.rb --twitter andrewsmhay --details
./web2intel.rb --sucuri_js

(C) Andrew Hay, 2014
http://www.andrewhay.ca
https://twitter.com/andrewsmhay

"
		end
	end
end