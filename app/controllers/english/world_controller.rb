class English::WorldController < ApplicationController
	@@news_type="World"
	caches_page :index
  def index
  end

	def bbc 
		@channel="BBC"
		load_news
	end

	def fox 
		@channel="FOX"
		load_news
	end
	
	def load_news
		@news = News.where("channel=? and news_type=? and date_format(news_date, '%Y-%m-%d')=?",@channel, @@news_type, @date).last
		@main_news = @news
		@news = (@news.nil?) ? [] : @news["news"]
	end
	
end
