Feature: Contacts test scenarios

  Background: Delete address book
    Given I search all the candidate's books
    And i remove all the candidate's books
    And i create a address book with characteristics
      | username  | password  |
      | josepaulo | josepaulo |
    And a create a group with characteristics
      | id | name   | description    |
      | 1  | family | my dear family |

  @contacts @blocker
  Scenario: Create a contact in a group
    Given i consult the last address book
    And my address book have "1" group
    When i create a contact with characteristics
      | groupId | name      | phone      |
      | 1       | charlotte | +123456789 |
    And the operation has success

  @contacts @major
  Scenario: Change a contact in a group
    Given i consult the last address book
    And my address book have "1" group
    And i create a contact with characteristics
      | groupId | name      | phone      |
      | 1       | charlotte | +123456789 |
    And the operation has success

    When i change a contact with characteristics
      | groupId | name      | phone        |
      | 1       | charlotte | +12345678900 |
    And the operation has success
    When i consult the contact "charlotte"
    Then the contact have characteristics
      | groupId | name      | phone        |
      | 1       | charlotte | +12345678900 |

  @contacts @critical
  Scenario: Delete a contact
    Given i consult the last address book
    And my address book have "1" group
    And i create a contact with characteristics
      | groupId | name      | phone      |
      | 1       | charlotte | +123456789 |
    And the operation has success

    When i delete the contact with name "charlotte"
    And the operation has success
    When i consult the last address book
    Then the address book does not have contacts


  @contacts @major
  Scenario: Create several contacts in address book
    Given i consult the last address book
    And my address book have "1" group
    When i create a contact with characteristics
      | groupId | name      | phone       |
      | 1       | charlotte | +1234567890 |
      | 1       | diane     | +1234567891 |
      | 1       | charles   | +1234567892 |
      | 1       | kelly     | +1234567893 |
      | 1       | gisele    | +1234567894 |
      | 1       | jean      | +1234567895 |
    And the operation has success
    When i consult the last address book
    Then the address book have "6" contacts

  @contacts @minor
  Scenario: Create a contact to a unexistent group
    Given i consult the last address book
    And my address book have "1" group
    When i create a contact with characteristics
      | groupId | name      | phone      |
      | 2       | charlotte | +123456789 |
    And the operation returns code "400"

    And i consult the last address book