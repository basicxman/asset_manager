require 'FileUtils'

module AssetManager

  class Manager

    def source(location, &block)
      AssetManager::FETCHERS.each do |f|
        if AssetManager::Fetch.send("is_#{f.to_s}?", location)
          @repo = AssetManager::Fetch.send(f, location)
          break
        end
      end

      instance_eval(&block)
    end

    def asset(source, target)
      location = "#{@repo}/#{source}"
      target_location = get_location(source, target)
      FileUtils.cp(location, target_location)
    rescue Exception => e
      File.open("./.assets/run.log", "a") do |file|
        file.puts e
      end
      puts "An error occurred running asset #{location}, logged to .assets/run.log."
    end

    def get_location(source, target)
      filename = source.split("/").last
      if target.is_a? Symbol
        "#{location_by_type(target)}/#{filename}"
      else
        target
      end
    end

    def location_by_type(type)
      case type
        when :stylesheet then "app/assets/stylesheets"
        when :javascript then "app/assets/javascript"
        when :image      then "app/assets/images"
      end
    end

  end

end
