class EventRequestsController < ApplicationController
  # GET /event_requests
  # GET /event_requests.json
  def index
    @event_requests = EventRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_requests }
    end
  end

  # GET /event_requests/1
  # GET /event_requests/1.json
  def show
    @event_request = EventRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_request }
    end
  end

  # GET /event_requests/new
  # GET /event_requests/new.json
  def new
    @event_request = EventRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_request }
    end
  end

  # GET /event_requests/1/edit
  def edit
    @event_request = EventRequest.find(params[:id])
  end

  # POST /event_requests
  # POST /event_requests.json
  def create
    @event_request = EventRequest.new(params[:event_request])

    respond_to do |format|
      if @event_request.save
        format.html { redirect_to @event_request, notice: 'Event request was successfully created.' }
        format.json { render json: @event_request, status: :created, location: @event_request }
      else
        format.html { render action: "new" }
        format.json { render json: @event_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_requests/1
  # PUT /event_requests/1.json
  def update
    @event_request = EventRequest.find(params[:id])

    respond_to do |format|
      if @event_request.update_attributes(params[:event_request])
        format.html { redirect_to @event_request, notice: 'Event request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_requests/1
  # DELETE /event_requests/1.json
  def destroy
    @event_request = EventRequest.find(params[:id])
    @event_request.destroy

    respond_to do |format|
      format.html { redirect_to event_requests_url }
      format.json { head :no_content }
    end
  end
end
