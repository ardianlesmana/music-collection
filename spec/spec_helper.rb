require 'rspec'
require_relative '../lib/music'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end

# Helper method for tests
module Music
  def self.reset()
    @collection = Collection.new
  end
end
