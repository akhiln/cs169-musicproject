Feature: Song Rating
  In order to provide a quantitative assessment of a song's quality
  the user
  wants to be able to rate songs
  
  Scenario: Initially rate a song
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsh@eghir.com"
      And "Brown" has uploaded a song with name "Fubarbaz.mp3", album "Albumatic", genre "Genrefull", and description "WHEEEEEEEE!"
      And I am on the rating page for the song "Fubarbaz.mp3"
    When I select "5" from "song_rating_rating"
      And I press "Submit"
    Then I should see "Fubarbaz.mp3"
      And I should see "5.00"
      
  Scenario: Change the rating of a song by rating it again
    Given there is a profile named "Smith" with password "password" and email "sredrog@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsieugr@eghir.com"
      And "Brown" has uploaded a song with name "Fubarbaz.mp3", album "Albumatic", genre "Genrefull", and description "WHEEEEEEEE!"
      And "Smith" has given the song "Fubarbaz.mp3" a rating of "5"
      And I am on the rating page for the song "Fubarbaz.mp3"
    When I select "3" from "song_rating_rating"
      And I press "Submit"
    Then I should see "Fubarbaz.mp3"
      And I should see "3.00"
      
  Scenario: Ratings are averaged between users
    Given there is a profile named "Smith" with password "password" and email "sredrog@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsieugr@eghir.com"
      And "Brown" has uploaded a song with name "Fubarbaz.mp3", album "Albumatic", genre "Genrefull", and description "WHEEEEEEEE!"
      And "Brown" has given the song "Fubarbaz.mp3" a rating of "5"
      And I am on the rating page for the song "Fubarbaz.mp3"
    When I select "3" from "song_rating_rating"
      And I press "Submit"
    Then I should see "Fubarbaz.mp3"
      And I should see "4.00"