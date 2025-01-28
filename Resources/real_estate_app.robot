*** Settings ***
Resource    ../Resources/PO/grant_device_location_permission.robot
Resource    ../Resources/PO/home_page.robot
Resource    ../Resources/PO/dismiss_cookies.robot
Resource    ../Resources/PO/filter_page.robot
Resource    ../Resources/PO/property_details_page.robot

*** Keywords ***
Grant Location Access Permission
    Gave Permission To Access Device Location

Dismiss Policy Notification
    Dismiss Policy By Clicking Button

Search and Verify Suggestion
    [Arguments]     ${CityName}
    Locate Home Page Search Bar
    Enter City Name In Search Bar   ${CityName}
    Verify City Name Present In Suggestion

Click Filter Icon
    Click HomePage Filters Icon

Set Search Criteria and Categories
    [Arguments]     ${MaxPrice}     ${PropertyType}     ${BedroomSize}
    Search By Categories    ${MaxPrice}     ${PropertyType}     ${BedroomSize}

Check The First Result
    Click The First Search Result On HomePage

Verify The Details Of Results
    Verify The Details Of Search Result




