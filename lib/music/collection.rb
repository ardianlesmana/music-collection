module Music
  class Collection
    attr_accessor :collection

    def initialize
      @collection = []
    end

    def add(album)
      raise DuplicateAlbumTitleError if is_title_dup?(album)
      @collection << album
    end

    def all
      @collection
    end

    private

    def is_title_dup?(album)
      return false if @collection.empty?

      dup = @collection.detect { |a| a.title == album.title }
      !dup.nil?
    end
  end
end
