Feature: Create and clean mock environments

Scenario: Customize mock environment configurations
	Given the default configuration shouldn't have "quiet"
	And I configure mock with "quiet"
	Then the default configuration should have "quiet"
	And the options sting should be "-q --configdir ./templates"

Scenario: Customize mock environment configurations with multiple configurations
	Given the default configuration shouldn't have "root"
	And I configure mock with "offline, root>>fedora-18-x86_64"
	Then the default configuration should have "offline,root>>fedora-18-x86_64"
	And the options sting should be "--offline --configdir ./templates -r fedora-18-x86_64"

Scenario: Remove option from mock environment default configuration
	Given I remove the option "configdir" from mock configuration
	Given the default configuration shouldn't have "configdir"
	And I configure mock with "offline, root>>fedora-18-x86_64"
	Then the default configuration should have "offline,root>>fedora-18-x86_64"
	And the options sting should be "--offline -r fedora-18-x86_64"

Scenario: Customize mock environment configurations with multiple configurations
	Given I create a new mock environment configuration with "verbose, debug"
	Then the options sting should be "-v --trace"

Scenario: Create a mock environment with with custom configurations
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	Then a directory named "/var/lib/mock/fedora-18-x86_64" should exist

Scenario: Clean the default a mock environment
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And a directory named "/var/lib/mock/fedora-18-x86_64" should exist
	And I clean the mock environment
	Then a directory named "/var/lib/mock/fedora-18-x86_64" should not exist