Feature: Playlist Rating
  In order to provide a quantitative assessment of a playlist's quality
  the user
  wants to be able to rate playlist
  
  Scenario: Initially rate a playlist
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsh@eghir.com"
      And "Brown" has created a playlist with name "Wii would like to play", and description "WHEEEEEEEE!"
      And I am on the rating page for the playlist "Wii would like to play"
    When I select "5" from "playlist_rating_rating"
      And I press "Submit"
    Then I should see "Wii would like to play"
      And I should see "5.00"
      
  Scenario: Change the rating of a playlist by rating it again
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsh@eghir.com"
      And "Brown" has created a playlist with name "Wii would like to play", and description "WHEEEEEEEE!"
      And "Smith" has given the playlist "Wii would like to play" a rating of "5"
      And I am on the rating page for the playlist "Wii would like to play"
    When I select "3" from "playlist_rating_rating"
      And I press "Submit"
    Then I should see "Wii would like to play"
      And I should see "3.00"
      
  Scenario: Playlist ratings are averaged between users
    Given there is a profile named "Smith" with password "password" and email "sredrog@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsieugr@eghir.com"
      And "Brown" has created a playlist with name "Wii would like to play", and description "WHEEEEEEEE!"
      And "Brown" has given the playlist "Wii would like to play" a rating of "5"
      And I am on the rating page for the playlist "Wii would like to play"
    When I select "3" from "playlist_rating_rating"
      And I press "Submit"
    Then I should see "Wii would like to play"
      And I should see "4.00"