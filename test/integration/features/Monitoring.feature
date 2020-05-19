Feature:
  As a DevOps engineer
  I want to ensure I can monitor the avilability and deployment status of an API proxy
  So that monitoring tools and platforms can raise alerts appropriately
  
  Scenario: Successfully GET /ping to check the proxy is deployed
    When I GET /ping
    Then response code should be 200
    And response body should be valid json
    And response body path $.success should be true
	
  Scenario: Successfully GET /health to check the proxy can reach the configured target
    When I GET /health
    Then response code should be 200
    And response body should be valid json
    And response body path $.success should be true