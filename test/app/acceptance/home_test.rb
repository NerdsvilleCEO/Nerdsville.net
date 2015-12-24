require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class HomeTest < AcceptanceSpec
  it "should show when we are on the home page" do
    visit "/home"
    assert_title "Nerdsville LLC - Home"
  end
end
