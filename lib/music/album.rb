module Music
  class Album
    attr_accessor :title, :artist, :is_played

    def initialize
      @title = ''
      @artist = ''
      @is_played = false
    end

    def to_s
      "\"#{@title}\" by #{@artist}"
    end
  end
end
