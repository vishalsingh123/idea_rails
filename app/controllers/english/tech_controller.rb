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
		@news = News.where("channel=? and news_type=? and date_format(news_date, '%Y-%m-%d')=?",@channel, @@news_type, @date).last
		@main_news = @news
		@news = (@news.nil?) ? [] : @news["news"]
	end
	
end
