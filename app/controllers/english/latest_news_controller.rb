class English::LatestNewsController < ApplicationController
	caches_page :index
	@@news_type="LATEST"

  def index
  end

	def in_latest
		@channel = "INTODAY"
		load_news
  end

  def zee_latest
		@channel = "ZEE"
		load_news
	end

	def ndtv_latest
		@channel = "NDTV"
		load_news
  end

  def toi_latest
		@channel = "TOI"
		load_news
  end
	
	def oneindia_latest
		@channel = "ONEINDIA"
		load_news
	end

	def load_news
		@news = News.where("channel=? and news_type=? and date_format(updated_at, '%Y-%m-%d')=?",@channel, @@news_type, @date).last["news"]
	end


	
end
