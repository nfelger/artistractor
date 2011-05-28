Feature: Extractivate
  Move b! Get out the text! Get out the text! Get out the text, b, get out the text!
  
  Scenario: Basic case
    When I ask for the text of 'fixtures/tragically-hip.html'
    Then the output should contain:
      | Blaise Pascal |
      # | Otter-heart posted a simple statement that seems to be part of my theme today. |