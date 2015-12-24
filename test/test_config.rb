RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

Capybara.app = Padrino.application
Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, :headers => {'User-Agent' => 'Capybara'})
end

class MiniTest::Spec
  include Rack::Test::Methods
  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app NerdsvilleNet::App
  #   app NerdsvilleNet::App.tap { |a| }
  #   app(NerdsvilleNet::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end

class AcceptanceSpec < Minitest::Spec
  include Capybara::DSL
  include Capybara::Assertions

  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end
