module AssetManager
  
  module Fetch

    def self.is_git?(source)
      if source[-4..-1] == ".git"
        true
      elsif source[0..5] == "git://"
        true
      elsif !source.match("github.com").nil?
        true
      else
        false
      end
    end
    
    def self.git(source)
      target = "./.assets/#{source.split("/").last}"
      if File.exists? target
        `cd #{target} && git pull`
      else
        `git clone #{source} #{target}`
      end
      target
    end

  end

end
