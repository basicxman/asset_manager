module AssetManager

  class Runner

    def initialize(source_file)
      a = AssetManager::Manager.new
      f = File.read(source_file)
      a.instance_eval(f)
    end

  end

end
