class PendingArticlesController < ApplicationController
  before_action :set_pending_article, only: [:show, :edit, :update, :destroy]

  # GET /pending_articles
  # GET /pending_articles.json
  def index
    @pending_articles = PendingArticle.all
  end

  # GET /pending_articles/1
  # GET /pending_articles/1.json
  def show
  end

  # GET /pending_articles/new
  def new
    @pending_article = PendingArticle.new
  end

  # GET /pending_articles/1/edit
  def edit
  end

  # POST /pending_articles
  # POST /pending_articles.json
  def create
    @pending_article = PendingArticle.new(pending_article_params)
    

    respond_to do |format|
      if @pending_article.save
        format.html { redirect_to @pending_article, notice: 'Pending article was successfully created.' }
        format.json { render :show, status: :created, location: @pending_article }
      else
        format.html { render :new }
        format.json { render json: @pending_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_articles/1
  # PATCH/PUT /pending_articles/1.json
  def update
    respond_to do |format|
      if @pending_article.update(pending_article_params)
        format.html { redirect_to @pending_article, notice: 'Pending article was successfully updated.' }
        format.json { render :show, status: :ok, location: @pending_article }
      else
        format.html { render :edit }
        format.json { render json: @pending_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_articles/1
  # DELETE /pending_articles/1.json
  def destroy
    @pending_article.destroy
    respond_to do |format|
      format.html { redirect_to pending_articles_url, notice: 'Pending article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_article
      @pending_article = PendingArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_article_params
      params.fetch(:pending_article, {})
    end
end
