Feature: Contact groups test scenarios

  Background: Delete address book
    Given i search all the candidate's books
    And i remove all the candidate's books
    And i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |

  @groups @blocker
  @TEST_ID-12
  Scenario: Create a new contact group
    Given i consult the last address book
    And i have a address book
    When i create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    Then the operation has success
    When i consult the last address book
    Then my address book have "1" groups
    Then i consult the last created group
    And the group have characteristics
      | name   | description    |
      | family | my dear family |

  @groups @critical
  @TEST_ID-13
  Scenario: Create two groups on a address book
    Given i consult the last address book
    And i have a address book
    When i create a group with characteristics
      | id | name   | description     |
      | 1  | family | my dear family  |
      | 2  | work   | work colleagues |
    Then the operation has success
    When i consult the last address book
    Then my address book have "2" groups

  @groups @major
  @TEST_ID-14
  Scenario: Consult group
    Given i consult the last address book
    And i have a address book
    And i create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    When i consult the last created group
    Then the operation has success

  @groups @major
  @TEST_ID-15
  Scenario: Delete group
    Given i consult the last address book
    And i have a address book
    And i create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    When i remove the last created group
    Then i consult the last created group
    And the group does not exist

  @groups @minor
  @TEST_ID-16
  Scenario: Update group
    Given i consult the last address book
    And i have a address book
    And i create a group with characteristics
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

  @groups @minor
  @TEST_ID-17
  Scenario: Create two groups on a address book with same id
    Given i consult the last address book
    And i have a address book
    When i create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |
    Then the operation has success
    When i create a group with characteristics
      | id | name | description     |
      | 1  | work | work colleagues |
    Then the operation have no success

    When i consult the last address book
    Then my address book have "1" groups