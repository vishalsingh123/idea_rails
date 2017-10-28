module ApplicationHelper
		def full_title(page_title)
    base_title = "Latest Khabar"
    page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
  end

	def full_description(page_description)
    base_description = "Latest Khabar"
    page_description.empty? ?  base_description : "#{base_description} | #{page_description}"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def admin?
   current_user.is_admin if current_user
  end

end
