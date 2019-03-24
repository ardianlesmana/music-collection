require File.join(File.dirname(__FILE__), 'spec_helper')
require 'pty'

describe "Runner" do
  describe ".run" do
    it "accepts option -v" do
      PTY.spawn('./bin/music', '-v') do |output, input|
        expect(output.gets.chomp).to eq("0.1.0")
      end
    end

    it "accepts option --version" do
      PTY.spawn('./bin/music', '--version') do |output, input|
        expect(output.gets.chomp).to eq("0.1.0")
      end
    end

    it "doesn't accept arguments" do
      PTY.spawn('./bin/music', 'hello') do |output, input|
        expect(output.gets.chomp).to eq("Music: unnecessary arguments `[\"hello\"]`")
      end
    end

    it "doesn't accept invalid option" do
      PTY.spawn('./bin/music', '-p') do |output, input|
        expect(output.gets.chomp).to eq("Music: invalid option `p`")
      end
    end

    it "starts shell loop" do
      shell = double('shell')
      allow(Music).to receive(:shell) { shell }
      expect(shell).to receive(:loop)

      Music::Runner.run
    end
  end
end
