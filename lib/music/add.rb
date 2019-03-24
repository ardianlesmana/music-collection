module Music
  module Add
    def self.interpret(command)
      responses = []

      matches = command.match(/^add "([\w\s]+)" "([\w\s]+)"$/)
      if matches
        album = Album.new
        album.title = matches[1]
        album.artist = matches[2]

        begin
          Music.collection.add(album)
        rescue DuplicateAlbumTitleError
          return ['Duplicate album title found, cannot add to collection']
        end

        responses << "Added #{album}"
        return responses
      end

      return responses
    end
  end
end
