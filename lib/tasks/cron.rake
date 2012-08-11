task :cron => :environment do
  Event.all.each do |event|
    if event.max_timestamp < Time.now.to_i
      event.images.destroy_all
      event.fill_images
  end
end