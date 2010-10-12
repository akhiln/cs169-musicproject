Feature: Manage music
  In order to manage their music
  the user
  wants to upload, delete and update their songs.
  
  Scenario: Upload new song
    Given I am on the upload song page
    When I fill in "Title" with "Song Title"
    And I fill in "Description" with "Song Description"
	And I select file "song.mp3" to upload
    And I press "Upload"
    Then I should see "Song Title"
    And I should see "Song Description"
    And I should see "song.mp3"
	And the new song should be created in the database
