class ImagesController < ApplicationController
  def index
    @images = Image.where('').order('img_time DESC').limit(200).page(params[:page]).per_page(16)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
      format.js
    end
  end

end
