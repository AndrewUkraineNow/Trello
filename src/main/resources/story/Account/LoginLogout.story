Description: Trello login/logout check

Lifecycle:
Examples:
/story/data/locators.table


Scenario: Verify that user can login to trello with valid creds
When I login with email `${email}` and password `${password}`


Scenario: Verify that user can log out of trello
When I log out


Scenario: Verify that user can not log in to trello with invalid email
When I fill in email `${email}` and wait for password field to appear
When I enter `invalidPassword` in field located by `<password-input-field>`
When I click on element located by `<login-button>`
When I wait until element located by `<error-message>` appears
