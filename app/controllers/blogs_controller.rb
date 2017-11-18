class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :like_or_unlike, :follow_or_unfollow, :add_comment]
  before_action :check_admin, except: [:index, :show, :add_comment, :like_or_unlike, :follow_or_unfollow]
  respond_to :html

  def index
		@categories = Category.all
    @blogs = Blog.all
		if params[:category_id] && params[:category_id].to_i>0
			@category = Category.find_by_id(params[:category_id])
			@blogs = @category.blogs
		end
    respond_with(@blogs)
  end

  def show
		set_toggle if current_user
		@comments = @blog.root_comments
		@related_blogs = Blog.where("id!=? and category_id=?", @blog.id, @blog.category_id).limit(6)
		respond_with(@blog)
  end

  def new
    @blog = Blog.new
    respond_with(@blog)
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
		@blog.user = current_user
		@blog.save
    respond_with(@blog)
  end

  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

	def like_or_unlike
		respond_to do |format|
			 current_user.toggle_like!(@blog)
				set_toggle
				format.js { render file: 'blogs/like_and_follow.js.erb' }
		end
	end

	def follow_or_unfollow
		respond_to do |format|
			 current_user.toggle_follow!(@blog)
				set_toggle
				format.js { render file: 'blogs/like_and_follow.js.erb' }
		end
	end

	def add_comment
		@comment = Comment.build_from( @blog, current_user.id, params[:desc] )	
		@comment.title = params[:title]
		respond_to do |format|
			if @comment.save
					set_toggle
					format.js{}
			end
		end
	end

	def delete_comment
	 	@comment = Comment.find_by_id(params[:id])	
		@blog = @comment.commentable
		respond_to do |format|
			if @comment && @comment.user == current_user
			 		@comment.destroy
					set_toggle
					format.js{}
			end
		end
	end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

		def set_toggle
			@like_toggle = (current_user.likes?(@blog)) ? "Unlike" : "Like"
			@follow_toggle = (current_user.follows?(@blog)) ? "Unfollow" : "Follow"
		end

    def blog_params
      params.require(:blog).permit(:title, :desc, :avatar, :category_id)
    end
end
