class SearchController < ApplicationController
  def index
		@query = params[:q]
    #@news = NewsIndex.query( match:{"news.Title": query})

=begin
		 @news = NewsIndex.query(query: {
																		bool:
																		{ 
																		 must: [
																			{ match:{"news.Title": query} }, 
																			{ match:{"news.Description": query} }
																		 ]
																		}
															}
														)
=end

    #@news = NewsIndex.source(includes: ["news.Title", "news.Description"]).query( multi_match:{query: query, type: "cross_fields",operator: "or", fields: ["news.Title", "news.Description"]})
    @news = NewsIndex.source(includes: ["news.Title", "news.Description"]).query(nested: {
															path: "news", 
															query: { bool: { should: [ 
																	{match: {"news.Title": @query}},
																	{match: {"news.Descrption": @query}} 
															] } } ,
															inner_hits: {
															}
														})
  end
end
