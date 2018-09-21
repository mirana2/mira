class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all


    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  
  end

  # GET /articles/new
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    parama = params[:article]
    record  = Article.new(category_id: parama[:category], title: parama[:title], lien: parama[:lien], image_url: parama[:image_url],icon_url: parama[:icon_url],description: parama[:description], tuto:parama[:tuto])
    request = current_user.request_for_create(record, reason: "something")
    request.save # Created Approval::Request record
    # parama = params[:article]
    # if current_user.reputation>=25
    #   @article = Article.new(category_id: parama[:category], title: parama[:title], lien: parama[:lien], image_url: parama[:image_url],icon_url: parama[:icon_url],description: parama[:description], tuto:parama[:tuto])
    # else 
    #   @article = PendingArticle.new(user_id:current_user.id, category_id: parama[:category], title: parama[:title], lien: parama[:lien], image_url: parama[:image_url],icon_url: parama[:icon_url],description: parama[:description], tuto:parama[:tuto])
    # end
    
    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #     format.json { render :show, status: :created, location: @article }
        
    #   else
    #     format.html { render :new }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      parama = params[:article]
      if @article.update(category_id: parama[:category], title: parama[:title], lien: parama[:lien], image_url: parama[:image_url],icon_url: parama[:icon_url],description: parama[:description], tuto:parama[:tuto])
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.fetch(:article, {})
    end
end
