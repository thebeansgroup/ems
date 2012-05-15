module Ems
  class ChannelsController < ApplicationController
    include ChannelQueryBuilder

    # GET /channels
    # GET /channels.json
    def index
      if params[:category_id]
        @channels = Channel.joins(:categories).where('ems_categories_channels.category_id' => params[:category_id])
      elsif params[:article_id]
        @channels = Channel.joins(:articles).where('ems_articles_channels.article_id' => params[:article_id])
      elsif params[:filters]
        @channels = build_query_from_filters Ems::Channel, params[:filters]
      else
        @channels = Channel.all
      end
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @channels }
      end
    end

    # GET /channels/1
    # GET /channels/1.json
    def show
      @channel = Channel.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @channel }
      end
    end

    # GET /channels/new
    # GET /channels/new.json
    def new
      @channel = Channel.new
      authorize! :new, @channel

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @channel }
      end
    end

    # GET /channels/1/edit
    def edit
      @channel = Channel.find(params[:id])
    end

    # POST /channels
    # POST /channels.json
    def create
      @channel = Channel.new(params[:channel])
      respond_to do |format|
        if @channel.save
          format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
          format.json { render json: @channel, status: :created, location: @channel }
        else
          format.html { render action: "new" }
          format.json { render json: @channel.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /channels/1
    # PUT /channels/1.json
    def update
      # make sure that we always have a categories array (empty means delete all)
      params[:channel][:category_ids] ||= []
      @channel = Channel.find(params[:id])
      respond_to do |format|
        if @channel.update_attributes(params[:channel])
          format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @channel.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /channels/1
    # DELETE /channels/1.json
    def destroy
      @channel = Channel.find(params[:id])
      @channel.destroy

      respond_to do |format|
        format.html { redirect_to channels_url }
        format.json { head :no_content }
      end
    end
  end
end
