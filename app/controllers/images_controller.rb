class ImagesController < ApplicationController
  def index
    @image_load = Image.order('img_time DESC').limit(48)

    @images = @image_load.paginate(:page => params[:page], :per_page => 16, :total_entries => @image_load.count)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
      format.js
    end
  end

end
