class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    
    interval_count = 5
  
    interval = ((@event.max_timestamp - @event.min_timestamp) / interval_count )
  
    instagram = Instaconcert::Instagram.new(:client_id => "46bd5797cd3d4ea685cbe3372510cf0c")
    
    @instagram_data_array = Array.new
    instagram_hash = Array.new(interval_count)
    instagram_hash.each_with_index do |item, i| 
      item = instagram.media_search(@event.lat, @event.long, @event.max_timestamp - interval*(interval_count-(i+1)), @event.min_timestamp + interval*(i), @event.distance)
      #write something to check response codes later
       
   #   if item["meta"] = 
      if item["data"] != nil then @instagram_data_array += item["data"]  
      #what in the ever living fuck makes this "if" necessary
      
      
      # instagram_likes = Array.new
      # #sort array by likes
      # @instagram_data_array.each_with_index do |jtem, j|
      #   jtem["likes"]["count"] = instagram_likes[j]
      # end 
      # 
      # instagram_likes.sort
      # 

      
    end
  end
    
      
    
    
    #@instagram_loc_id = instagram.location_search(@event.lat, @event.long, @event.distance)["data"][0]["id"].to_s
 
 
   #@instagram_loc_id = instagram.location_search_4sq_id("40dcbc80f964a52081011fe3", @event.distance)["data"][0]["id"].to_s
 
    
    
    # hardcoded location_id to Wrigley Field 
    #@instagram_hash = instagram.location_recent(@instagram_loc_id, @event.max_timestamp, @event.min_timestamp)

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
