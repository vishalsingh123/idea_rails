Rails.application.routes.draw do


	root "english/latest_news#index"
  get 'search', to: "search#index"
  get 'social' => "social#index"

	namespace :english do
		get "latest_news" => "latest_news#index"
		get "latest_news/in_latest" => "latest_news#in_latest"
		get "latest_news/zee_latest" => "latest_news#zee_latest"
		get "latest_news/ndtv_latest" => "latest_news#ndtv_latest"
		get "latest_news/toi_latest" => "latest_news#toi_latest"
		get "latest_news/oneindia_latest" => "latest_news#oneindia_latest"

		get "finance" => "finance#index"
		get "finance/business_standard" => "finance#business_standard"
		get "finance/money_control" => "finance#money_control"
		get "finance/et" => "finance#et"
		get "finance/zee" => "finance#zee"
		get "finance/market_action" => "finance#market_action"

		get "cricket" => "cricket#index"
		get "cricket/cb" => "cricket#cb"
		get "cricket/espn" => "cricket#espn"
	
		get "entertainment" => "entertainment#index"
		get "entertainment/bollywood_hungama" => "entertainment#bollywood_hungama"
		get "entertainment/indian_express" => "entertainment#indian_express"
		get "entertainment/first_post" => "entertainment#first_post"
		get "entertainment/rediff" => "entertainment#rediff"

		get "tech" => "tech#index"
		get "tech/gadgets_now" => "tech#gadgets_now"
		get "tech/techgig" => "tech#techgig"
	end
	namespace :hindi do
		get "latest_news" => "latest_news#index"
		get "latest_news/dainik" => "latest_news#dainik"
		get "latest_news/ndtv" => "latest_news#ndtv"
		get "latest_news/zee" => "latest_news#zee"
		get "latest_news/abp" => "latest_news#abp"
		get "latest_news/aaj_tak" => "latest_news#aaj_tak"
		get "latest_news/news24" => "latest_news#news24"

		get "entertainment-news" => "entertainment#index"
		get "entertainment-news/zee" => "entertainment#zee"
	end

	get "/blogs/like_or_unlike"
	get "/blogs/follow_or_unfollow"
	post "/blogs/add_comment"
	get "/blogs/delete_comment"
	resources :blogs

	get "/articles/like_or_unlike"
	get "/articles/follow_or_unfollow"
	post "/articles/add_comment"
	get "/articles/delete_comment"
  resources :articles
	devise_for :users , :controllers => {:omniauth_callbacks => "omniauth_callbacks", :registrations => 'registrations'  }
  devise_scope :user do
      match '/users/sign_out' => 'devise/sessions#destroy', via: [:get, :delete]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
