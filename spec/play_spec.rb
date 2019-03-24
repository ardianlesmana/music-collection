require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Play" do
  before(:each) do
    Music.reset
  end

  describe ".interpret" do
    it "process `play \"$title\"` command" do
      Music::Add.interpret('add "Ride the Lightning" "Metallica"')
      r = Music::Play.interpret('play "Ride the Lightning"')
      expect(r).to eq(["You're listening to \"Ride the Lightning\""])
    end

    it "cannot play non existing title" do
      r = Music::Play.interpret('play "Ride the Cloud"')
      expect(r).to eq(["Cannot locate album \"Ride the Cloud\""])
    end
  end
end
