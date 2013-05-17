Feature: Checkout Traversal
  In order to run your buisiness
  A user should buy product

  Scenario: Checkout should add item to spree_line_items
    Given I am on a subscribable product page
    And I am seeing a button with text 'Subscribe'
    When I fill "line_item[duration]" with 1
    And  I select "Month" from 'line_item[interval]'
    And I click on button "Subscribe"
    Then line_items count should be greater than 0



