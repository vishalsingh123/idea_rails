class English::TechController < ApplicationController
	@@news_type="Technology"
	caches_page :index
  def index
  end

	def gadgets_now 
		@channel="GadgetsNow"
		load_news
	end

	def techgig 
		@channel="TechGig"
		load_news
	end
	
	def load_news
		@news = News.where("channel=? and news_type=? and date_format(updated_at, '%Y-%m-%d')=?",@channel, @@news_type, @date).last["news"]
	end
	
end
