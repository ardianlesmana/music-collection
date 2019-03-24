module Music
  def self.shell() @shell ||= Shell.new end
  def self.collection() @collection ||= Collection.new end
end

require 'music/shell'
require 'music/runner'
require 'music/add'
require 'music/album'
require 'music/collection'
require 'music/errors'
require 'music/version'
