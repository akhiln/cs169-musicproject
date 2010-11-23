Feature: Song Commenting
  In order to provide a community driven experience, users can leave comments on songs.
  
  Scenario: Leave a comment on a song
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsh@eghir.com"
      And "Brown" has created a song with name "Cool", and description "WHEEEEEEEE!"
      And I am on the show page for the song "Cool"
      And I follow "Comment"
    When I fill in "Comment" with "A Test Comment"
      And I press "Post"
    Then I should see "A Test Comment"
