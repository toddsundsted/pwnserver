Feature: pwn twitter
  Start on the first page of tweets (which are chronologically later) and grab
  pages of tweets, intelligently taking into account pages of tweets that have
  already been pwned.

  Scenario: six tweets and then one more tweet
    Given 6 tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 0 new tweets from page 3
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 1 new tweet from page 1
    And I pwn page 3
    And I collect 0 new tweets from page 3
    And I have 7 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 0 new tweets from page 3
    And I have 7 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 0 new tweets from page 3
    And I have 7 unique tweets
    And I have 1 segment

  Scenario: six tweets and then six new tweets
    Given 6 tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 0 new tweets from page 3
    And I have 12 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 5
    And I collect 0 new tweets from page 5
    And I have 12 unique tweets
    And I have 1 segment


  Scenario: ten pwns
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 9 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 3 new tweets from page 4
    And I have 12 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 5
    And I collect 3 new tweets from page 5
    And I have 15 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 6
    And I collect 3 new tweets from page 6
    And I have 18 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 7
    And I collect 3 new tweets from page 7
    And I have 21 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 8
    And I collect 3 new tweets from page 8
    And I have 24 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 9
    And I collect 3 new tweets from page 9
    And I have 27 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 10
    And I collect 0 new tweets from page 10
    And I have 27 unique tweets
    And I have 1 segment

  Scenario: no new tweets
    Given 12 tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 9 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 3 new tweets from page 4
    And I have 12 unique tweets
    And I have 1 segment

  Scenario: one new tweet
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 1 new tweet from page 1
    And I pwn page 3
    And I collect 2 new tweets from page 3
    And I have 9 unique tweets
    And I have 1 segment

  Scenario: two new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 2 new tweets from page 1
    And I pwn page 3
    And I collect 1 new tweet from page 3
    And I have 9 unique tweets
    And I have 1 segment

  Scenario: three new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 0 new tweets from page 2
    And I have 9 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 3 new tweets from page 4
    And I have 12 unique tweets
    And I have 1 segment

  Scenario: four new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 1 new tweet from page 2
    And I have 10 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 2 new tweets from page 4
    And I have 12 unique tweets
    And I have 1 segment

  Scenario: five new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 2 new tweets from page 2
    And I have 11 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 1 new tweet from page 4
    And I have 12 unique tweets
    And I have 1 segment

  Scenario: six new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 0 new tweets from page 3
    And I have 12 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 5
    And I collect 3 new tweets from page 5
    And I have 15 unique tweets
    And I have 1 segment

  Scenario: seven new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 1 new tweet from page 3
    And I have 13 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 5
    And I collect 2 new tweets from page 5
    And I have 15 unique tweets
    And I have 1 segment

  Scenario: eight new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 2 new tweets from page 3
    And I have 14 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 5
    And I collect 1 new tweet from page 5
    And I have 15 unique tweets
    And I have 1 segment

  Scenario: nine new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 15 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 0 new tweets from page 4
    And I have 15 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 6
    And I collect 3 new tweets from page 6
    And I have 18 unique tweets
    And I have 1 segment

  Scenario: ten new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 15 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 1 new tweet from page 4
    And I have 16 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 6
    And I collect 2 new tweets from page 6
    And I have 18 unique tweets
    And I have 1 segment

  Scenario: eleven new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 15 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 2 new tweets from page 4
    And I have 17 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 6
    And I collect 1 new tweet from page 6
    And I have 18 unique tweets
    And I have 1 segment

  Scenario: twelve new tweets
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 15 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 3 new tweets from page 4
    And I have 18 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 5
    And I collect 0 new tweets from page 5
    And I have 18 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 7
    And I collect 3 new tweets from page 7
    And I have 21 unique tweets
    And I have 1 segment

  Scenario: nine new tweets twice
    When I pwn twitter
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 6 unique tweets
    And I have 1 segment
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 12 unique tweets
    And I have 2 segments
    When I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I tweet
    And I pwn twitter again
    Then I pwn page 1
    And I collect 3 new tweets from page 1
    And I pwn page 2
    And I collect 3 new tweets from page 2
    And I have 18 unique tweets
    And I have 3 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 3
    And I collect 3 new tweets from page 3
    And I have 21 unique tweets
    And I have 3 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 4
    And I collect 0 new tweets from page 4
    And I have 21 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 6
    And I collect 3 new tweets from page 6
    And I have 24 unique tweets
    And I have 2 segments
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 7
    And I collect 0 new tweets from page 7
    And I have 24 unique tweets
    And I have 1 segment
    When I pwn twitter again
    Then I pwn page 1
    And I collect 0 new tweets from page 1
    And I pwn page 9
    And I collect 3 new tweets from page 9
    And I have 27 unique tweets
    And I have 1 segment
