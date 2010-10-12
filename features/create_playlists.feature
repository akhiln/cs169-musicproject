Feature: Create Playlists
  In order to share music
  the user
  wants to create a playlist
  
  Scenario: Create new playlist
    Given I am logged in as "Foo"
      And I have uploaded songs "Bar" and "Beque"
      And I am on the manage music page
    When I click New Playlist
      And name it "test"
      And add songs "Bar" and "Beque"
    Then there should be a playlist called "test"
      And it should contain songs "Bar" and "Beque"
      
  Scenario: Add a song to a playlist
    Given I am logged in as "Foo"
      And I have a playlist called "test"
      And I am on the view playlist page
    When I add song "abcd" to "test"
    Then "test" should contain "abcd"