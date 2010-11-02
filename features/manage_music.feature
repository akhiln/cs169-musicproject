Feature: Manage music
  In order to manage their music
  the user
  wants to upload, delete and update their songs.    
    
  Scenario: Upload new song
    Given there is a profile named "Smith" with password "password" and email "auhgeirugh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password"
      And I am on the upload song page
    When I fill in "song_name" with "Some bad song"
      And I fill in "song_album" with "Terrible Album"
      And I fill in "song_length" with "waaay too long"
      And I fill in "song_genre" with "unlikeable"
      And I fill in "song_description" with "May cause your ears to bleed"
      And I fill in "song_rating" with "1"
      And I upload the song "Kalimba.mp3"
      And I press "Create"
    Then I should see "Some bad song"
      And I should see "May cause your ears to bleed"
      And I should see "Delete"
      And I should see "Add to Playlist"
      And there should be a player on the page
  
  Scenario: Delete song
    Given I am on the manage music page
      And there is a song called "Foo"
    When I click the delete button
    Then "Foo" should be deleted from the database
  
  Scenario: Update song
    Given I am on the manage music page
      And there is a song called "Foo"
    When I change the title of "Foo" to "Bar"
      And click the submit button
    Then "Foo" should no longer be in the database
      And "Bar" should be in the database