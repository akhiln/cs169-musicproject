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

  Scenario: view a profile
    Given there is a profile named "Foo"
      And there is a profile named "Bar"
      And I am signed in as "Bar"
      And "Foo" has uploaded a song called "Dear Bar"
    When I am on the profile for "Foo"
    Then I should see a profile picture
      And I should see navigation links
      And I should see the song "Bar"
