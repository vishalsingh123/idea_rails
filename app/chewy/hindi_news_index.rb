class HindiNewsIndex < Chewy::Index
		define_type HindiNews do
			field :channel, :news_type, :news_date
			field :news, value: ->(hindi_news) { hindi_news.news.to_json} 
		end
end
