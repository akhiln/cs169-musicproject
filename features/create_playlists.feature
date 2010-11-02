Feature: Create Playlists
  In order to share music
  the user
  wants to create a playlist
  
  Scenario: Create new playlist
    Given there is a profile named "foo" with password "barbarbar" and email "foo@bar.com"
      And I am signed in as "foo" using password "barbarbar"
      And "foo" has uploaded a song called "beque"
    When I visit Make a new playlist
      And I name it "test"
      And I am on the profile for "foo"
    Then I should see "test" within "#playlists"
      
 