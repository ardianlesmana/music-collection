require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Collection" do
  describe ".add" do
    it "will add album to collection" do
      a = Music::Album.new
      a.title = "Title"
      a.artist = "Band"

      c = Music::Collection.new
      c.add(a)

      expect(c.all.count).to eq(1)
      expect(c.all[0]).to eq(a)
    end

    it "reject non unique album title" do
      a = Music::Album.new
      a.title = "Title"
      a.artist = "Band"

      c = Music::Collection.new
      c.add(a)

      b = Music::Album.new
      b.title = "Title"
      b.artist = "Person"

      expect { c.add(b) }.to raise_error(Music::DuplicateAlbumTitleError)
    end
  end

  describe ".all" do
    it "returns all album in the collection" do
      c = Music::Collection.new
      for x in 1..2
        a = Music::Album.new
        a.title = "Title#{x}"
        a.artist = "Band"

        c.add(a)
      end

      expect(c.all.count).to eq(2)
      expect(c.all[0].title).to eq("Title1")
      expect(c.all[1].title).to eq("Title2")
    end
  end
end
