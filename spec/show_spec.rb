require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Show" do
  before(:each) do
    Music.reset
  end

  describe ".interpret" do
    it "process `show all` command" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
      end
      r = Music::Show.interpret('show all')
      expect(r[0]).to eq("\"Title1\" by Awesome Band (unplayed)")
      expect(r[1]).to eq("\"Title2\" by Awesome Band (unplayed)")
      expect(r[2]).to eq("\"Title3\" by Awesome Band (unplayed)")
    end

    it "detects empty collection" do
      r = Music::Show.interpret('show all')
      expect(r).to eq(["Collection is empty"])
    end

    it "process `show unplayed` command" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
      end
      Music::Play.interpret("play \"Title1\"")

      r = Music::Show.interpret('show unplayed')
      expect(r.count).to eq(2)
      expect(r[0]).to eq("\"Title2\" by Awesome Band")
      expect(r[1]).to eq("\"Title3\" by Awesome Band")
    end

    it "detects zero unplayed album" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
        Music::Play.interpret("play \"Title#{x}\"")
      end

      r = Music::Show.interpret('show unplayed')
      expect(r).to eq(["Collection has no unplayed album"])
    end

    it "process `show all by \"$artist\"` command" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
        Music::Add.interpret("add \"Title#{x+3}\" \"So so Band\"")
      end

      r = Music::Show.interpret('show all by "So so Band"')

      expect(r.count).to eq(3)
      expect(r[0]).to eq("\"Title4\" by So so Band (unplayed)")
      expect(r[1]).to eq("\"Title5\" by So so Band (unplayed)")
      expect(r[2]).to eq("\"Title6\" by So so Band (unplayed)")
    end

    it "detects zero album by artist" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
      end

      r = Music::Show.interpret('show all by "So so Band"')

      expect(r).to eq(["Collection has no album by artist So so Band"])
    end

    it "process `show unplayed by \"$artist\"` command" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
      end
      Music::Play.interpret("play \"Title1\"")

      r = Music::Show.interpret('show unplayed by "Awesome Band"')

      expect(r.count).to eq(2)
      expect(r[0]).to eq("\"Title2\" by Awesome Band")
      expect(r[1]).to eq("\"Title3\" by Awesome Band")
    end

    it "detects zero unplayed album by artist" do
      for x in 1..3
        Music::Add.interpret("add \"Title#{x}\" \"Awesome Band\"")
        Music::Play.interpret("play \"Title#{x}\"")
      end

      r = Music::Show.interpret('show unplayed by "Awesome Band"')

      expect(r).to eq(["Collection has no unplayed album by artist Awesome Band"])
    end
  end
end
