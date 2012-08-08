class ImagesController < ApplicationController
  def index
    @images = Image.where('').order('img_time DESC').limit(28)
  end
end
