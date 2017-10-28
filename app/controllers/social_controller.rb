class SocialController < ApplicationController
  def index
		@tweets = Social.all.order(id: :desc).limit(20) 
  end
end
