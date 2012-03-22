module Ems
  class CategoriesController < ApplicationController
    # GET /categories
    # GET /categories.json
    def index
      if params[:channel_id]
        @categories = Category.joins(:channels).where('categories_channels.channel_id' => params[:channel_id])
      else
        @categories = Category.all
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @categories }
      end
    end
  
    # GET /categories/1
    # GET /categories/1.json
    # OR
    # GET /categories/slug
    # GET /categories/slug.json
    def show
      # Because we can get categories either by ID or by their slug we try to first get the category by casting the
      # param[:id] to an Integer, when that fails we try to retrieve it by slug
     begin
        @category = Category.find(Integer(params[:id]))
      rescue
        @category = Category.where('slug' => params[:id])
      end
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
