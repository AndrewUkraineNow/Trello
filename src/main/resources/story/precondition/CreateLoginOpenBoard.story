Description: Create board, login and open created board
Lifecycle:
Examples:
/story/data/locators.table


Scenario: Verify that user can create board with API
Given I initialize SCENARIO variable `url` with value `${api_url}/1/boards?key=${key}&token=${token}`
Given I initialize SCENARIO variable `generatedBoardName` with value `#{toLowerCase(#{generate(Ancient.god '10', '25', 'false')})}`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
Given request body: {
                    "name": "${generatedBoardName}"
                    }
When I execute HTTP POST request for resource with URL `${url}`
Then `${response-code}` is equal to `200`
Then JSON element by JSON path `$.name` is equal to `"${generatedBoardName}"` ignoring extra fields
When I save JSON element from context by JSON path `$.id` to SCENARIO variable `id_board`
When I save JSON element from context by JSON path `$.name` to STORY variable `name_board`


Scenario: Verify that user can login and open created board on UI
When I login with email `${email}` and password `${password}`
When I wait until element located by `By.xpath((//div[@title='<name_board>'])[1])` appears
When I click on element located by `By.xpath((//div[@title='<name_board>'])[1])`
Then the page with the URL containing '<name_board>' is loaded
When I wait until element located by `<add-another-list>` appears
When I wait until element located by `<automation-button>` appears
Examples:
|name_board                                  |
|#{removeWrappingDoubleQuotes(${name_board})}|
