module Music
  def self.shell() @shell ||= Shell.new end
end

require 'music/shell'
require 'music/runner'
require 'music/version'
