Feature: List Uploaded Songs
  In order to view all of the songs they have uploaded
  the user
  wants a listing of all of their songs

  Scenario: View my songs without uploading songs
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
    When I go to the my songs page
    And I should see "You haven't uploaded any songs yet!" within "#songs"

  Scenario: View my songs after uploading a song
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And "Smith" has created a song named "Cool", with genre "Rock"
      And "Smith" has created a song named "Sad", with genre "Blues"
    When I go to the my songs page
    And I should see "Cool" within "#songs"
    And I should see "Sad" within "#songs"

  