module Ems
  class ArticlesController < ApplicationController
   load_and_authorize_resource    
   
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
    # GET /articles/new.json
    def new
      @article = Article.new(:category => Category.find(params[:category_id]))
      @article.assets.build
      @article.category = Category.find params[:category_id]
        
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }
      end
    end
  
    # GET /articles/1/edit
    def edit
      @article = Article.find(params[:id])
      @article.assets.build
    end
  
    # POST /articles
    # POST /articles.json
    def create
      @article = Article.new(params[:article])
  
      respond_to do |format|
        if @article.save
          format.html { redirect_to edit_category_article_path(@article.category, @article), notice: 'Article was successfully created.' }
          format.json { render json: @article, status: :created, location: @article }
        else
          format.html { render action: "new", :category_id => @article.category, :id => @article }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /articles/1
    # PUT /articles/1.json
    def update
      @article = Article.find(params[:id])
  
      respond_to do |format|
        if @article.update_attributes(params[:article])
          format.html { redirect_to edit_category_article_path(@article.category, @article), notice: 'Article was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit", :category_id => @article.category, :id => @article }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @article = Article.find(params[:id])
      category = @article.category
      @article.destroy
  
      respond_to do |format|
        format.html { redirect_to category_articles_path(category), notice: 'Article was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end
end
