require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "/home" do
  before do
    get "/home"
  end

  it "should return 200" do
    assert last_response.ok?
  end
end
