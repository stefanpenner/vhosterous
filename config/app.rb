module Vhosterous
  class App
    def self.initialize!
      @root = Pathname.new(File.expand_path('../../',__FILE__))
    end
    def self.root
      @root
    end
  end
end
