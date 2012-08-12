task :cron => :environment do
  Event.all.each do |event|
    if event.max_timestamp < Time.now.to_i
      if event.min_timestamp > (Time.now - 1.days).to_i
        if event.images.count < 3
          event.images.destroy_all
          event.fill_images
        end
      end
    end
  end
end