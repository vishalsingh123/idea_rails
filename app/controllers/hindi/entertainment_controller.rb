class Hindi::EntertainmentController < ApplicationController
	@@news_type="ENTERTAINMENT"
	caches_page :index

  def index
  end

	def zee 
		@channel = "ZEE"
		load_news
  end

	def load_news
		@news = HindiNews.where("channel=? and news_type=? and date_format(news_date, '%Y-%m-%d')=?",@channel, @@news_type, @date).last
		@main_news = @news
		@news = (@news.nil?) ? [] : @news["news"]
	end
	
end
