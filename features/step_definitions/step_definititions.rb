# -*- encoding : utf-8 -*-

Then(/^the default configuration should(n't)? have "(.*?)"$/) do |control_flag, configuration_string|
  configurations = TestHelper.parse_options_string configuration_string

  if control_flag
    configurations.each{ |key, value| raise if get_options[key] == value}
  else
    configurations.each{ |key, value| raise unless get_options[key] == value}
  end
end

Given(/^I configure mock with "(.*?)"$/) do |options_string|
  update_options TestHelper.parse_options_string options_string
end

Then(/^the options sting should be "(.*?)"$/) do |options_string|
  default_options = parse_options(get_options).strip
  unless  default_options == options_string
    raise "Current configurations '#{default_options}' does not match given '#{options_string}'"
  end
end

Given(/^I remove the option(?:s)? "(.*?)" from mock configuration$/) do |options_string|
  options = options_string.split(/\s*,\s*/).map{|option| option.to_sym}
  remove_options options
end

Given(/^I create a new mock environment configuration with "(.*?)"$/) do |options_string|
  new_options TestHelper.parse_options_string options_string
end

Given(/^I create a new mock environment$/) do
  init
end

Given(/^I clean the mock environment$/) do
  clean
end

Given(/^I (install|remove) the rpm package(s)? "(.*?)"$/) do |install_flag, package_arity, package_list|
  package_list = package_list.split(/\s*,\s*/).join(" ") if package_arity
  install_flag == "install" ? install(package_list) : remove(package_list)
end

Then(/^the execution of the command "(.*)" should(n't)? work$/) do |command, control_flag|
  begin
    shell command
  rescue MockWrapper::CommandExecuitonError => e
    raise e unless control_flag
  end
end

Given(/^I copy the local (?:file|folder) "(.*?)" to mock "(.*?)"$/) do |local_path, chroot_path|
  copy_in local_path, chroot_path
end

Given(/^I copy the (?:file|folder) "(.*?)" from mock to local "(.*?)"$/) do |chroot_path, local_path|
  copy_out chroot_path, local_path
end
