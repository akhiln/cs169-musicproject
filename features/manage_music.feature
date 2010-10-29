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