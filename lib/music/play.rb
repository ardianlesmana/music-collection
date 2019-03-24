module Music
  module Play
    def self.interpret(command)
      responses = []

      matches = command.match(/^play "([\w\s]+)"$/)
      if matches

        found_albums = Music.collection.all.select do |album|
          album.title == matches[1]
        end

        the_album = nil
        if found_albums.size == 1
          the_album = found_albums[0]
          the_album.is_played = true
        end

        if the_album.nil?
          responses << "Cannot locate album \"#{matches[1]}\""
          return responses
        end

        responses << "You're listening to \"#{the_album.title}\""
        return responses
      end

      return responses
    end
  end
end
