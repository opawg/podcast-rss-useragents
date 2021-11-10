require "minitest/autorun"
require "json"

def valid_json? str
  !!JSON.parse(str)
rescue Exception => e
  false
end

describe "The JSON" do
  before do
    file  = File.join(File.dirname(__FILE__), "..", "src", "rss-ua.json")
    @json = File.read(file)
  end

  it "parses successfully as valid JSON" do
    assert valid_json?(@json)
  end
end
