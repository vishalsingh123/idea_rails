class Hindi::LatestNewsController < ApplicationController
	@@news_type="LATEST"
	caches_page :index
  def index
  end

	def dainik
		@channel="DAINIK"
		load_news
  end

	def ndtv
		@channel="NDTV"
		load_news
	end

	def zee
		@channel="ZEE"
		load_news
	end

	def abp 
		@channel="ABP"
		load_news
	end

	def aaj_tak 
		@channel="AAJTAK"
		load_news
	end

	def news24 
		@channel="NEWS24"
		load_news
	end

	def load_news
		@news = HindiNews.where("channel=? and news_type=? and date_format(updated_at, '%Y-%m-%d')=?",@channel, @@news_type, @date).last
		@news = (@news.nil?) ? [] : @news["news"]
	end

end
