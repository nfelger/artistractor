Feature: Extractivate
  Move b! Get out the text! Get out the text! Get out the text, b, get out the text!
  
  Scenario: Basic case
    Given I've set up 'http://gaga.blog' to return 'fixtures/gaga.html'
    When I ask for the text of 'http://gaga.blog'
    Then the output should contain:
      | GaGa |