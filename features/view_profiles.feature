Feature: View Profiles
  In order to find music
  the user
  wants to view profiles
  
  Scenario: view a profile
    Given there is a profile named "Foo"
      And "Foo" has uploaded a song called "Bar"
    When I view the profile for "Foo"
    Then I should see a profile picture
      And I should see navigation links
      And I should see the song "Bar"