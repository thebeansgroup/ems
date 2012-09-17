module Ems
  class NewsController < ApplicationController
    load_and_authorize_resource :class => Ems::News
    # GET /news
    # GET /news.json
    def index
      @news = News.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @news }
      end
    end
  
    # GET /news/1
    # GET /news/1.json
    def show
      @news = News.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @news }
      end
    end
  
    # GET /news/new
    # GET /news/new.json
    def new
      @news = News.new
      @news.assets.build
      @news.category = Category.find params[:category_id]
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @news }
      end
    end
  
    # GET /news/1/edit
    def edit
      @news = News.find(params[:id])
      @news.assets.build
    end
  
    # POST /news
    # POST /news.json
    def create
      @news = News.new(params[:news])
  
      respond_to do |format|
        if @news.save
          format.html { redirect_to edit_category_news_path(@news.category, @news), notice: 'News was successfully created.' }
          format.json { render json: @news, status: :created, location: @news }
        else
          format.html { render action: "new", :category_id => @news.category, :id => @news }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /news/1
    # PUT /news/1.json
    def update
      @news = News.find(params[:id])
  
      respond_to do |format|
        if @news.update_attributes(params[:news])
          format.html { redirect_to edit_category_news_path(@news.category, @news), notice: 'News was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit", :category_id => @news.category, :id => @news }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /news/1
    # DELETE /news/1.json
    def destroy
      @news = News.find(params[:id])
      category = @news.category
      @news.destroy
  
      respond_to do |format|
        format.html { redirect_to category_news_index_path(category), notice: 'News was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end
end
