# -*- encoding : utf-8 -*-
require 'aruba/cucumber'
require 'fileutils'

require File.join(File.dirname(__FILE__), "test_helper.rb")
require File.join(File.dirname(__FILE__), "..", "..", "lib", "mock_helper.rb")

#Helper method to parse *.feature input arguments
class TestHelper
  def self.parse_options_string configuration_string
    configurations = configuration_string.split(",").map{|config| config.strip}
    new_configurations = {}
    configurations.each do |configuration|
      key, value = configuration.split(">>")
      new_configurations[key.to_sym] = (value or true)
    end
    return new_configurations
  end
end

#Configure aruba to use local folder instead of ./tmp/aruba
Before do
  @dirs = ["."]
end

#Clear files and folders from previous executions
Dir["/tmp/mock_test_f*"].each{|entry| FileUtils.rm_r(entry)}

World do
  MockWrapper.new
end