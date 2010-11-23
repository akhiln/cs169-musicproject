Feature: Browse By Genre
  In order to discover new music, the user wants to browse music by genre
  
  Scenario: Browse By Genre
    Given there is a profile named "Smith" with password "password" and email "srguh@iuhriguer.com"  
      And I am signed in as "Smith" using password "password" 
      And there is a profile named "Brown" with password "password" and email "srsh@eghir.com"
      And "Brown" has created a song named "Cool", with genre "Rock"
    When I go to the browse page
    Then I should see "Rock"
    
