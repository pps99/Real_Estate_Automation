*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/common.robot
Resource    ../Resources/real_estate_app.robot
Resource    ../Data/city_name_max_price.robot
Test Setup      common.Open Real Estate Application
Test Teardown   common.Close Real Estate Application

*** Test Cases ***
Search and Validate Real Estate Listings with Filters
    [Documentation]     This test is about searching and validating Real Estate Listings with Filters
    [Tags]  Smoke
    real_estate_app.Grant Location Access Permission
    real_estate_app.Dismiss Policy Notification
    real_estate_app.Search and Verify Suggestion    ${CityName}
    real_estate_app.Click Filter Icon
    real_estate_app.Set Search Criteria and Categories  ${MaxPrice}     ${PropertyType}     ${BedroomSize}
    real_estate_app.Check The First Result
    real_estate_app.Verify The Details Of Results






