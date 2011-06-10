module AssetManager
  
  module Fetch

    def self.is_git?(source)
      true if source[-4..-1] == ".git"
      true if source[0..5] == "git://"
      true unless source.match("github.com").nil?
      false
    end
    
    def self.git(source)
      target = "./git/#{source.split("/").last}"
      `git clone #{source} #{target}`
    end

  end

end
