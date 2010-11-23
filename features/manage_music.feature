Feature: Manage music
  In order to manage their music
  the user
  wants to upload, delete and update their songs.    

#  Scenario: Upload new song
#    Given there is a profile named "Smith1" with password "password" and email "auhgeirugh@iuhriguer.com"  
#      And I am signed in as "Smith1" using password "password"
#      And I am on the upload song page
#    When I fill in "song_name" with "Some bad song"
#      And I fill in "song_album" with "Terrible Album"
#      And I fill in "song_genre" with "unlikeable"
#      And I fill in "song_description" with "May cause your ears to bleed"
#      And I upload the song "Kalimba.mp3"
#      And I press "Create"
#    Then I should see "Some bad song"
#      And I should see "May cause your ears to bleed"
#      And I should see "Delete"
#      And I should see "Add to Playlist"

  Scenario: Edit song
    Given there is a profile named "Smith2" with password "password" and email "ouhg@ieurhgi.com"
      And I am signed in as "Smith2" using password "password"
      And "Smith2" has uploaded a song with name "Fubarbaz.mp3", album "Albumatic", genre "Genrefull", and description "WHEEEEEEEE!"
      And I am editing the song "Fubarbaz.mp3"
    When I fill in "song_name" with "Bazowski.mp3"
      And I fill in "song_album" with "Ally the Bum"
      And I fill in "song_genre" with "Alternative Energy"
      And I fill in "song_description" with "!EEEEEEEEEEHW"
      And I press "Update"
    Then the database should contain a song named "Bazowski.mp3"
      And the database should not contain a song named "Fubarbaz.mp3"