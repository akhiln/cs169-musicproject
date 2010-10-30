Feature: Play Song
  In order to hear music
  the user
  wants to play songs
  
  Scenario: Play song
    Given I am on the profile page of user "Foo"
      And "Foo" has uploaded a song called "Bar"
    When I click the play button for "Bar"
    Then the song "Bar" should start playing