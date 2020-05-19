Feature:
  As an API Engineer
  I want to ensure faults raised by the common security policies are handled
  So that errors returned by APIs are presented in a consistent format
  
  Scenario: Ensure faults raised by the regular expression policy return an appropriate error conforming to the standard error response
    
    When I GET /?query=delete from sometable
    Then response code should be 403
    And response body path $.code should be 403.00.001
    And response body path $.message should be threat detected; security policy violated

