class English::FinanceController < ApplicationController
	@@news_type="FINANCE"
	caches_page :index
  def index
		@service = FetchService.new
		@market = @service.fetch_today_stock_action
  end

	def market_action
		@result = @service.fetch_today_stock_action
		render json: @result
  end

	def business_standard 
		@channel="BusinessStandard"
		load_news
	end

	def money_control
		@channel="MoneyControl"
		load_news
	end

	def et
		@channel="ET"
		load_news
	end

	def zee
		@channel="ZEE"
		load_news
	end
	
	def load_news
		@news = News.where("channel=? and news_type=? and date_format(updated_at, '%Y-%m-%d')=?",@channel, @@news_type, @date).last["news"]
	end

end
