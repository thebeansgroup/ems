module Ems
  class CategoriesController < ApplicationController
    # GET /categories
    # GET /categories.json
    def index
      if params[:channel_id]
        @categories = Category.includes(:channels).where('categories_channels.channel_id' => params[:channel_id])
      else
        @categories = Category.all
      end
      # @categories  = '[{"channel_id":1,"created_at":null,"id":1,"name":"test","slug":"test","strapline":"test","updated_at":null,"channels":[{"created_at":null,"id":1,"name":"chan","slug":"chan","updated_at":null}]},{"channel_id":1,"created_at":null,"id":3,"name":"test3","slug":"test3","strapline":"test3","updated_at":null,"channels":[{"created_at":null,"id":1,"name":"chan","slug":"chan","updated_at":null}]}]'
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @categories.as_json(:include => :channels) }
      end
    end
  
    # GET /categories/1
    # GET /categories/1.json
    def show
      @category = Category.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @category }
      end
    end
  
    # GET /categories/new
    # GET /categories/new.json
    def new
      @category = Category.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @category }
      end
    end
  
    # GET /categories/1/edit
    def edit
      @category = Category.find(params[:id])
    end
  
    # POST /categories
    # POST /categories.json
    def create
      @category = Category.new(params[:category])
  
      respond_to do |format|
        if @category.save
          format.html { redirect_to @category, notice: 'Category was successfully created.' }
          format.json { render json: @category, status: :created, location: @category }
        else
          format.html { render action: "new" }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /categories/1
    # PUT /categories/1.json
    def update
      @category = Category.find(params[:id])
  
      respond_to do |format|
        if @category.update_attributes(params[:category])
          format.html { redirect_to @category, notice: 'Category was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /categories/1
    # DELETE /categories/1.json
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
  
      respond_to do |format|
        format.html { redirect_to categories_url }
        format.json { head :no_content }
      end
    end
  end
end
