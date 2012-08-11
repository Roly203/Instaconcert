task :cron => :environment do
  Event.all.each do |event|
    if event.max_timestamp < Time.now.to_i
      if event.images.count < 3
        event.images.destroy_all
        event.fill_images
      end
    end
  end
end