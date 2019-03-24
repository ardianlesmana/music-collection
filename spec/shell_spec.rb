require File.join(File.dirname(__FILE__), 'spec_helper')
require 'pty'

describe "Shell" do
  describe "loop" do
    it "prints welcome and exit message" do
      PTY.spawn('./bin/music') do |output, input|
        expect(output.gets.chomp).to eq("")
        expect(output.gets.chomp).to eq("Welcome to your music collection!")
        expect(output.gets.chomp).to eq("")

        input.puts "exit"
        output.gets

        expect(output.gets.chomp).to eq("")
        expect(output.gets.chomp).to eq("Bye!")
        expect(output.gets.chomp).to eq("")
      end
    end

    it "shows prompt" do
      PTY.spawn('./bin/music') do |output, input|
        3.times { output.gets }

        input.puts "test"
        expect(output.gets.chomp).to eq("> test")
      end
    end

    it "handles interrupt" do
      PTY.spawn('./bin/music') do |output, input, pid|
        3.times { output.gets }

        Process.kill("INT", pid)
        expect(output.gets.chomp).to eq("> ")
      end
    end

    it "interprets input" do
      PTY.spawn('./bin/music') do |output, input, pid|
        3.times { output.gets }

        input.puts "hello"
        output.gets

        expect(output.gets.chomp).to eq("")
        expect(output.gets.chomp).to eq("Unknown command, please try again")
      end
    end
  end
end
