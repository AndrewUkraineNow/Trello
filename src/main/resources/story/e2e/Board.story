Description: Trello board check

GivenStories:/story/precondition/CreateLoginOpenBoard.story
Lifecycle:
Examples:
/story/data/locators.table


Scenario: Verify that user can create card on UI
When I click on element located by `<add-another-list>`
When I wait until element located by `<list-name-field>` appears
When I enter `#{generate(Ancient.hero '5', '10', 'false')}` in field located by `<list-name-field>`
When I click on element located by `<add-list-button>`
When I click on element located by `<add-card-button>`
When I execute steps while counter is less than or equal to `10` with increment `3` starting from `1`:
|step                                                                                                                                |
|Given I initialize SCENARIO variable `card-name` with value `#{generate(Ancient.hero '5', '10', 'false')}`                          |
|When I enter `${card-name}` in field located by `<card-name-field>`                                                                 |
|When I click on element located by `<card-submit-button>`                                                                           |
|When I wait until element located by `By.xpath(//div[@class='list js-list-content']//span[contains(text(),'${card-name}')])` appears|


Scenario: Verify that user can delete board with API
When I delete current board by API


Scenario: Verify that user can log out of trello on UI
When I log out
