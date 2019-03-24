module Music
  module Show
    def self.interpret(command)
      responses = []

      matches = command.match(/^show all$/)
      if matches
        Music.collection.all.each do |album|
          responses << "#{album} (#{album.is_played ? 'played' : 'unplayed'})"
        end

        return responses unless responses.empty?
        return ['Collection is empty']
      end

      matches = command.match(/^show unplayed$/)
      if matches
        unplayed_coll = Music.collection.all.select do |album|
          album.is_played == false
        end
        unplayed_coll.each do |album|
          responses << album.to_s
        end

        return responses unless responses.empty?
        return ['Collection has no unplayed album']
      end

      matches = command.match(/^show all by "([\w\s]+)"$/)
      if matches
        artist_coll = Music.collection.all.select do |album|
          album.artist == matches[1]
        end
        artist_coll.each do |album|
          responses << "#{album} (#{album.is_played ? 'played' : 'unplayed'})"
        end

        return responses unless responses.empty?
        return ["Collection has no album by artist #{matches[1]}"]
      end

      matches = command.match(/^show unplayed by "([\w\s]+)"$/)
      if matches
        artist_coll = Music.collection.all.select do |album|
          album.artist == matches[1] && !album.is_played
        end
        artist_coll.each do |album|
          responses << album.to_s
        end

        return responses unless responses.empty?
        return ["Collection has no unplayed album by artist #{matches[1]}"]
      end

      return responses
    end
  end
end
