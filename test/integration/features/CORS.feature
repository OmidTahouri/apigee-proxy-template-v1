Feature:
  As an API consumer with a browser-based application
  I want to ensure the API can support my CORS and preflight request requirements
  So that my application can send cross-origin requests to the API

Scenario: Check the proxy can support browser preflight requests on the base path
    When I request OPTIONS for /
    Then response code should be 200
    And response header content-length should be 0
    And response header access-control-allow-headers should be origin, x-requested-with, accept
    And response header access-control-allow-methods should be get, post, put, delete
    And response header access-control-max-age should be 86400

Scenario: Check the proxy can support browser preflight requests on an arbitrary path
    When I request OPTIONS for /foobar
    Then response code should be 200
    And response header content-length should be 0
    And response header access-control-allow-headers should be origin, x-requested-with, accept
    And response header access-control-allow-methods should be get, post, put, delete
    And response header access-control-max-age should be 86400