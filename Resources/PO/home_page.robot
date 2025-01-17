*** Settings ***
Library     AppiumLibrary

*** Variables ***
${NavBarSearchHeader} =     xpath=//android.widget.EditText[@content-desc="Search properties by address, MLS number, and more."]
${InputTextSelector} =      xpath=//android.widget.EditText[@resource-id="x:id/page.listings.search_textbox.textbox"]
${SuggestionXPath} =        xpath=//android.view.ViewGroup[contains(@content-desc, 'Ottawa')]
${FilterButton} =           xpath=//android.view.ViewGroup[@resource-id="x:id/page.listings.filters"]
${HomeLists} =              xpath=(//android.view.ViewGroup[@resource-id="x:id/listing.price_card"])[1]


*** Keywords ***
Locate Home Page Search Bar
    Wait Until Page Contains Element    ${NavBarSearchHeader}
    Click Element    ${NavBarSearchHeader}

Enter City Name In Search Bar
    [Arguments]     ${SearchCity}
    Input Text    ${InputTextSelector}    ${SearchCity}

Verify City Name Present In Suggestion
    Wait Until Page Contains Element    ${SuggestionXPath}
    Click Element    ${SuggestionXPath}

Click HomePage Filters Icon
    Click Element    ${FilterButton}

Click The First Search Result On HomePage
    Wait Until Page Contains Element    ${HomeLists}
    Click Element    ${HomeLists}
