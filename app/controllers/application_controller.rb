class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	
	rescue_from ActionController::RoutingError, :with => :render_404
	before_action :set_date

 private

  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end

    render :file => "#{Rails.root}/public/page-404.html", :status => 404
  end

	def check_admin	
		if !current_user||!current_user.is_admin
      #gflash :error=> "You are not authorised to perform this action"
      redirect_to ('/blogs')
    end
	end

	def set_date
		@date =  (params[:date]) ?  params[:date] : Time.now.strftime("%Y-%m-%d")
	end

	end
