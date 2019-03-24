require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Add" do
  before(:each) do
    Music.reset
  end

  describe ".interpret" do
    it "process `add \"$title\" \"$artist\"` command" do
      r = Music::Add.interpret('add "Ride the Lightning" "Metallica"')
      expect(r).to eq(["Added \"Ride the Lightning\" by Metallica"])
    end

    it "will reject duplicate title" do
      Music::Add.interpret('add "Ride the Lightning" "Metallica"')
      r = Music::Add.interpret('add "Ride the Lightning" "Angelica"')
      expect(r).to eq(["Duplicate album title found, cannot add to collection"])
    end
  end
end
