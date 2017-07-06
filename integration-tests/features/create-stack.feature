Feature: Create stack

  @now
  Scenario: create new stack
    Given stack "A" does not exist
    and the template for stack "A" is valid_template.json
    When the user creates stack "A"
    Then stack "A" exists in "CREATE_COMPLETE" state

  @now
  Scenario: create a stack that already exists
    Given stack "A" exists in "CREATE_COMPLETE" state
    and the template for stack "A" is valid_template.json
    When the user creates stack "A"
    Then stack "A" exists in "CREATE_COMPLETE" state

  @now
  Scenario: create new stack that has previously failed
    Given stack "A" exists in "CREATE_FAILED" state
    and the template for stack "A" is valid_template.json
    When the user creates stack "A"
    Then stack "A" exists in "CREATE_FAILED" state
