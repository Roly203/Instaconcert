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
    if (Image.find_all_by_event_id(@event.id)[0] = []) then
      
      
          interval_count = 5
                          
                            interval = ((@event.max_timestamp - @event.min_timestamp) / interval_count )
                            
                            instagram = Instaconcert::Instagram.new(:client_id => "46bd5797cd3d4ea685cbe3372510cf0c")
                            
                            @instagram_image_array = Array.new
                            instagram_hash = Array.new(interval_count)
                            
                            #Make the API  Media/Search calls
                            instagram_hash.each_with_index do |item, i| 
                              item = instagram.media_search(@event.lat, @event.long, 
                                                            @event.max_timestamp - interval*(interval_count-(i+1)),
                                                            @event.min_timestamp + interval*(i), 
                                                            @event.distance)
                              
                              
                              
                              #write something to check response codes later
                               
                                    if item["data"] and item["meta"]["code"] = 200 then 
                                        @instagram_image_array += item["data"]  
                                    end 
                        
                              
                              
                              # instagram_likes = Array.new
                              # #sort array by likes
                              # @instagram_data_array.each_with_index do |jtem, j|
                              #   jtem["likes"]["count"] = instagram_likes[j]
                              # end 
                              # 
                              # instagram_likes.sort
                              # 
                           
                            end
                                                    
                            @instagram_image_array.each_with_index do |img, i|
                              new_img = Image.new
                              new_img[:instagram_id] = img["id"]
                              new_img[:lat] = img["location"]["latitude"]
                              new_img[:long] = img["location"]["longitude"]
                              new_img[:img_lowres_url] = img["images"]["low_resolution"]["url"]
                              new_img[:img_thumb_url] = img["images"]["thumbnail"]["url"]
                              new_img[:img_standard_url] = img["images"]["standard_resolution"]["url"]
                              #if img["id"] = "238555744168411625_11614703" then puts img["caption"]
                             # end
                              if img["caption"] then 
                                new_img[:caption_text] = img["caption"]["text"]
                                new_img[:caption_time] = Time.at(img["caption"]["created_time"].to_i)
                              end
                              if img ["likes"]
                                new_img[:like_count] = img["likes"]["count"]
                              end
                              new_img[:img_time] = Time.at(img["created_time"].to_i)
                              new_img[:instagram_link_url] = img["link"]
                              new_img[:event_id] = @event.id
                              
                              new_img.save
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
