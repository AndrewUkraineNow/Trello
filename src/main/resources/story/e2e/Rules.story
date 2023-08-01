Description: Check rules automation

GivenStories:/story/precondition/CreateLoginOpenBoard.story
Lifecycle:
Examples:
/story/data/locators.table


Scenario: Verify that user can open automation pop-up on Board page
When I click on element located by `<automation-button>`
When I wait until element located by `<rules-button>` appears
When I click on element located by `<rules-button>`
When I wait until element located by `<rules-iframe>` appears
When I switch to frame located `<rules-iframe>`
When I wait until element located by `<create-automation>` appears
When I click on element located by `<create-automation>`
When I wait until element located by `<add-trigger-button>` appears


Scenario: Verify that user can add trigger: card move to top
When I click on element located by `<add-trigger-button>`
When I wait until element located by `<select-trigger-button>` appears
When I click on element located by `<select-trigger-button>`
When I wait until element located by `<output-move-trigger>` appears
When I wait until element located by `<list-name-field-to-do>` appears
When I enter `To Do` in field located by `<list-name-field-to-do>`
When I wait until element located by `<select-action-button>` appears
When I click on element located by `<select-action-button>`
When I wait until element located by `<action-move-trigger>` appears
When I wait until element located by `<save-rules-button>` appears
When I click on element located by `<save-rules-button>`


Scenario: Verify that user can close automation pop-up on Board page
When I click on element located by `<close-auto-button>`
When I wait until element located by `<create-automation>` disappears


Scenario: Verify that card move to top trigger is applying when adding new card
When I click on element located by `<add-card-button>`
When I execute steps while counter is less than or equal to `10` with increment `3` starting from `1`:
|step                                                                                                                      |
|Given I initialize SCENARIO variable `card-name` with value `#{toLowerCase(#{generate(Animal.genus)})}`                   |
|When I enter `${card-name}` in field located by `<card-name-field>`                                                       |
|When I click on element located by `<card-submit-button>`                                                                 |
|When I wait until element located by `<added-card-location>` appears                                                      |
|When I save `href` attribute value of element located `<added-card-location>` to SCENARIO variable `v_href`               |
|Then `${card-name}` matches `#{toLowerCase(#{replaceAllByRegExp(^(.*[\\\-]), , #{extractPathFromUrl(${v_href})})})}`      |
Examples:
|added-card-location                                                                |
|By.xpath((//a[contains(@class,'list-card') and contains(@href,'${card-name}')])[1])|


Scenario: Verify that user can delete board by API
When I delete current board by API
