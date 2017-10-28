class English::CricketController < ApplicationController
	@@news_type="CRICKET"
	caches_page :index
  def index
		@matches = fetch_latest_matches
  end

	def cb 
		@channel="CB"
		load_news
	end

	def espn
		@channel="ESPN"
		load_news
	end

	def load_news
		@news = News.where("channel=? and news_type=? and date_format(updated_at, '%Y-%m-%d')=?",@channel, @@news_type, @date).last["news"]
	end

	
private

	def fetch_latest_matches
    result = Array.new        
    doc1 = Nokogiri::HTML(open('http://www.cricbuzz.com/api/html/homepage-scag'))
    doc1.xpath("//div[@class='cb-col-100 cb-col cb-hm-scg-blk ']//div[@class='cb-col cb-col-25 cb-mtch-blk']").each do |link|
      hash = Hash.new
      hash["teamA"] = clean_result link.at_xpath('./a/div[1]/div[1]')
      hash["teamAScore"] = clean_result link.at_xpath('./a/div[1]/div[2]')
      hash["teamB"] = clean_result link.at_xpath('./a/div[2]/div[1]')
      hash["teamBScore"] = clean_result link.at_xpath('./a/div[2]/div[2]')
      hash["result"] = clean_result link.at_xpath('./a/div[3]')
      hash["link"] = clean_result link.at_xpath('./a/@href')
      result << hash unless hash["teamA"].blank?
    end
    result
  end

	def clean_result res
    content = nil
    unless res.nil?
      content = res.content.strip
    # content.gsub!(/\P{ASCII}/, '')
    end
    content
  end
	
end
