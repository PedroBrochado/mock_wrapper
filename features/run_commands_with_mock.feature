Feature: Install packages on mock environment


Scenario: Create a mock environment to run a successful command
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	Then the execution of the command "ls" should work

Scenario: Create a mock environment to run a failing command
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	Then the execution of the command "ls -d *some_strage_phrase_here*" shouldn't work