Feature: User Profiles
  In order to find music
  the user
  wants to create and view profiles
  
  Scenario: create an account
  Given I am not signed in
    And I am on the signup page
  When I fill in "Name" with "test dummy"
    And I fill in "Bio" with "a test user"
    And I fill in "Login" with "testdummy"
    And I fill in "Email" with "testdummy@adsfkjkandsf.com"
    And I fill in "Password" with "password"
    And I fill in "Confirm Password" with "password"
    And I press "Sign up"
  Then there should be a user named "test dummy"
    And the picture of "test dummy" is default

  Scenario: view someone else's profile
    Given there is a profile named "Foo" with password "blahblah" and email "asd@adf.com"
      And there is a profile named "Bar" with password "blahblahblah" and email "asds@adf.com"
      And I am signed in as "Bar" using password "blahblahblah"
      And "Foo" has uploaded a song called "Dear Bar"
    When I am on the profile for "Foo"
    Then I should see "Dear Bar" within "#songs"
      And I should see "Foo" within "#name_and_pic"
      And should not see "Add a song" within "#songs"

 Scenario: View  my own profile
  Given there is a profile named "MyName" with password "blahblah" and email "mine@adf.com"
    And I am signed in as "MyName" using password "blahblah"
  When I am on the profile for "MyName"
  Then I should see "Add a song" within "#songs"
    And I should see "Make a new playlist" within "#playlists"
    And I should see "Edit Profile" within "#info"

Scenario: Edit my information
  Given there is a profile named "MyName2" with password "blahblah" and email "minee@adf.com"
    And I am signed in as "MyName2" using password "blahblah"
  When I am on the edit user page for "MyName2"
    And I fill in "Name" with "MyName3"
    And I press "Update"
    And I am on the profile for "MyName3"
  Then I should see "MyName3" within "#name_and_pic"
    And I should not see "MyName2"



