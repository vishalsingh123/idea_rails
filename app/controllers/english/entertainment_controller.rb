class English::EntertainmentController < ApplicationController
	@@news_type="ENTERTAINMENT"
	caches_page :index
  def index
  end

	def bollywood_hungama 
		@channel="BollywoodHungama"
		load_news
	end

	def indian_express 
		@channel="IndianExpress"
		load_news
	end
	
	def first_post 
		@channel="FirstPost"
		load_news
	end

	def rediff
		@channel="Rediff"
		load_news
	end

	def load_news
		@news = News.where("channel=? and news_type=? and date_format(updated_at, '%Y-%m-%d')=?",@channel, @@news_type, @date).last["news"]
	end

end
