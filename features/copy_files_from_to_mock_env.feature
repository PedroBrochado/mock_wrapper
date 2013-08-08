Feature: Copy files to and from mock environments

Scenario: Create a mock environment to copy a file in
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And an empty file named "/tmp/mock_test_file_in"
	And I copy the local file "/tmp/mock_test_file_in" to mock "/mock_test_file_in"
	And the execution of the command "ls /mock_test_file_in" should work

Scenario: Create a mock environment to copy a folder in
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And a directory named "/tmp/mock_test_folder_in"
	And I copy the local folder "/tmp/mock_test_folder_in" to mock "/mock_test_folder_in"
	And the execution of the command "ls /mock_test_folder_in" should work

Scenario: Create a mock environment to copy a file from it
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And the execution of the command "touch /mock_test_file_out" should work
	And I copy the file "/mock_test_file_out" from mock to local "/tmp/mock_test_file_out"
	Then a file named "/tmp/mock_test_file_out" should exist

Scenario: Create a mock environment to copy a folder from it
	Given I configure mock with "quiet, offline, root>>fedora-18-x86_64"
	And I create a new mock environment
	And the execution of the command "mkdir /mock_test_folder_out" should work
	And I copy the folder "/mock_test_folder_out" from mock to local "/tmp/mock_test_folder_out"
	Then a directory named "/tmp/mock_test_folder_out" should exist