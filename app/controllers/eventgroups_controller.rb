class EventgroupsController < ApplicationController
  # GET /eventgroups
  # GET /eventgroups.json
  def index
    @eventgroups = Eventgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventgroups }
    end
  end

  # GET /eventgroups/1
  # GET /eventgroups/1.json
  def show
    @eventgroup = Eventgroup.find(params[:id])
    @events = Event.where('eventgroup_id = ?',params[:id]).where('max_timestamp < ?',DateTime.now.to_i).order("start_time DESC")
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eventgroup }
    end
  end

  # GET /eventgroups/new
  # GET /eventgroups/new.json
  def new
    @eventgroup = Eventgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eventgroup }
    end
  end

  # GET /eventgroups/1/edit
  def edit
    @eventgroup = Eventgroup.find(params[:id])
  end

  # POST /eventgroups
  # POST /eventgroups.json
  def create
    @eventgroup = Eventgroup.new(params[:eventgroup])

    respond_to do |format|
      if @eventgroup.save
        format.html { redirect_to @eventgroup, notice: 'Eventgroup was successfully created.' }
        format.json { render json: @eventgroup, status: :created, location: @eventgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @eventgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventgroups/1
  # PUT /eventgroups/1.json
  def update
    @eventgroup = Eventgroup.find(params[:id])

    respond_to do |format|
      if @eventgroup.update_attributes(params[:eventgroup])
        format.html { redirect_to @eventgroup, notice: 'Eventgroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eventgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventgroups/1
  # DELETE /eventgroups/1.json
  def destroy
    @eventgroup = Eventgroup.find(params[:id])
    @eventgroup.destroy

    respond_to do |format|
      format.html { redirect_to eventgroups_url }
      format.json { head :no_content }
    end
  end
end
