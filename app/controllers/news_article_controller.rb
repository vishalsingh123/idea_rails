class NewsArticleController < ApplicationController
  def index
		@src = params[:src]
		@channel = params[:channel]
		@type = params[:news_type]
		@news_date = params[:news_date]
		@medium = params[:medium]

		if @medium=="english"
			@main_news = News.where(news_type: @type, channel: @channel, news_date: @news_date).first
		elsif @medium=="hindi"
			@main_news = HindiNews.where(news_type: @type, channel: @channel, news_date: @news_date).first
		end
		
		@related_news = (@main_news.nil?) ? [] : @main_news["news"]

  end

end
