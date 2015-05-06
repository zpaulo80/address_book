Feature: Contact groups test scenarios

  Background: Delete address book
    Given I search all the candidate's books
    And i remove all the candidate's books
    And i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |

  @groups
  Scenario: Create a new contact group
    Given i consult the last address book
    And i have a address book
    When a create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    Then the operation has success
    When i consult the last address book
    Then my address book have "1" group
    Then i consult the last updated group
    And the group have characteristics
      | name   | description |
      | family | my dear family   |

  @groups
  Scenario: Create two groups on a address book
    Given i consult the last address book
    And i have a address book
    When a create a group with characteristics
      | id | name   | description     |
      | 1  | family | my dear family  |
      | 2  | work   | work colleagues |
    Then the operation has success
    When i consult the last address book
    Then my address book have "2" group

  @groups
  Scenario: Consult group
    Given i consult the last address book
    And i have a address book
    And a create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    When i consult the last created group
    Then the operation has success

  @groups
  Scenario: Delete group
    Given i consult the last address book
    And i have a address book
    And a create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    When i remove the last created group
    Then i consult the last created group
    And the group does not exist

  @groups
  Scenario: Update group
    Given i consult the last address book
    And i have a address book
    And a create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    And the operation has success

    When i change a group to
      | id | name   | description |
      | 1  | family | my family   |
    And the operation has success

    Then i consult the last updated group
    And the group have characteristics
      | name   | description |
      | family | my family   |