require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Album" do
  describe ".to_s" do
    it "prints as \"$title\" by $artist" do
      a = Music::Album.new
      a.title = "Hello"
      a.artist = "World!"

      expect(a.to_s).to eq("\"Hello\" by World!")
    end
  end
end
