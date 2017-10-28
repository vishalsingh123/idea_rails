require 'open-uri'
class BaseService

	def fetch_sensex
		uri = URI.parse("http://www.bseindia.com/markets/Equity/SensexData.aspx?radn=261220161457") 
		sensex_string = uri.read
		data = sensex_string.split("@")
	end

private

	def parse link, xpath, args
		link.xpath(xpath).each do |link1|
      res_hash = Hash.new
      res_hash["Title"]       = clean_result link1.at_xpath(args[0])
next if res_hash["Title"].nil?
      res_hash["Description"] = clean_result link1.at_xpath(args[1])
      res_hash["Link"]        = clean_result link1.at_xpath(args[2])
      res_hash["ImgLink"]     = clean_result link1.at_xpath(args[3])
      yield res_hash
    end
	end
	
	def clean_result res
		content = nil
		unless res.nil? 
			content = res.content.strip
		#	content.gsub!(/\P{ASCII}/, '')
		end
		content
	end

end
