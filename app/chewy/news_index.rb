class NewsIndex < Chewy::Index
		define_type News do
			field :channel, :news_type, :news_date
			field :news, value: ->(news) { news.news.to_json} 
		end
end
