require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "NerdsvilleNet::App::HomeHelper" do
  before do
    @helpers = Class.new
    @helpers.extend NerdsvilleNet::App::HomeHelper
  end

  def helpers
    @helpers
  end
end
