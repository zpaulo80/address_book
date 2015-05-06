Feature: Address book test scenarios

  Background: Delete address book
    Given I search all the candidate's books
    Given i remove all the candidate's books

  @address_book
  Scenario: Create address book
    When i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |
    Then the operation has success

  @address_book
  Scenario: Create two Address books for same user
    Given i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |
    And the operation has success
    When i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |
    Then the operation has success
    And I search all the candidate's books
    And the candidate will have "2" address books


  @address_book
  Scenario: Update address book
    Given i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |
    And the operation has success
    When i change a address book characteristics to
      | username  | password  |
      | josepaulo | paulojose |
    Then the operation has success
    And the address book has characteristics
      | username  | password  |
      | josepaulo | paulojose |

  @address_book
  Scenario: Remove address book
    Given i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |
    And the operation has success
    When i remove the last address book
    Then the operation has success
    When i consult the last address book
    Then the address book does not exists

