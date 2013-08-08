Feature: (Un)install packages on mock environments

Scenario: Create a mock environment to remove a single packages
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And I remove the rpm package "rpm-build"
	Then the execution of the command "rpmbuild --version" shouldn't work

Scenario: Create a mock environment to remove multiple packages
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And I remove the rpm package "rpm-build, libxml2"
	Then the execution of the command "rpmbuild --version" shouldn't work
	And the execution of the command "ls /lib*/libxml2*" shouldn't work

Scenario: Create a mock environment to remove and install a single package
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And I remove the rpm package "rpm-build"
	And I install the rpm package "rpm-build"
	Then the execution of the command "rpmbuild --version" should work

Scenario: Create a mock environment to remove and install multiple packages