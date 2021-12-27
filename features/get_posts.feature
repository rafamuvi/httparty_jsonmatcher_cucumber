Feature: GET Posts

    Scenario: GET all posts
        Given I have the posts endpoint
        When I make a GET request
        Then should respond with a list of posts
        And status code "200"

    Scenario: GET one post
        Given I have the posts endpoint
        When I make a GET request with id "1"
        Then should respond with a post
        And status code "200"