Feature: Manage music
  In order to manage their music
  the user
  wants to upload, delete and update their songs.    
    
  Scenario: Upload new song
    Given there is a profile named "Smith"
      And I am signed in as "Smith"
      And I am on the upload song page
    Then show me the page
  
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