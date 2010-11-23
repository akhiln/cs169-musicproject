Feature: Playlist Commenting
  In order to provide a community driven experience, users can leave comments on playlists.
  
  Scenario: Leave a comment on a playlist
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsh@eghir.com"
      And "Brown" has created a playlist with name "Cool Playlist", and description "WHEEEEEEEE!"
      And I am on the comment page for the playlist "Cool Playlist"
    When I fill in "playlist_comment_text" with "A Test Comment"
      And I press "Post"
    Then I should see "A Test Comment"
