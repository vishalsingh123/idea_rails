class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :new, :edit, :add_comment]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :add_comment]
  before_action :check_admin, except: [:index, :show, :add_comment]
  respond_to :html

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
		@comments = @article.root_comments
		respond_with(@article)
  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_with(@article)
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def add_comment
			@comment = Comment.build_from( @article, current_user.id, params[:desc] )	
			@comment.title = params[:title]
			respond_to do |format|
				if @comment.save
						format.js{}
				end
			end
		end

		def delete_comment
			@comment = Comment.find_by_id(params[:id])	
			@article = @comment.commentable
			respond_to do |format|
				if @comment && @comment.user == current_user
						@comment.destroy
						format.js{}
				end
			end
		end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:category, :title, :desc, :source, :author)
    end

		
end
