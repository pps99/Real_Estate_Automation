*** Settings ***
Library     AppiumLibrary

*** Variables ***
${ForSaleButton} =      xpath=//android.widget.TextView[@text="For Sale"]
${BedroomCategory} =    xpath=//android.widget.TextView[@text="Bedrooms"]
${IncBedroomCountBtn} =     xpath=//android.widget.Button[@content-desc="Increase bedroom count"]
${PropTypeLocator} =    xpath=//android.view.ViewGroup[@content-desc="Property type"]
${ResidentialType} =    xpath=//android.view.ViewGroup[@content-desc="x:id/Residential.deselected"]
${ResultsButton} =      id=x:id/page.property_search.search_button
${ClickMaxPrice} =      id=x:id/filters.range.max_dropdown
${DropdownScrollView} =       id=x:id/dropdown.scrollview
${TargetValue} =              xpath=//android.view.ViewGroup[@content-desc="800,000"]
${Status} =     False

*** Keywords ***
Search By Categories
    [Arguments]     ${MaxPrice}
    Click For Sale Button
    Scroll and Select Value     ${MaxPrice}
    Choose Bedroom Size
    Choose PropertyType
    Click Results Button

Click For Sale Button
    Wait Until Page Contains Element   ${ForSaleButton}
    Click Element    ${ForSaleButton}

Scroll and Select Value
    [Arguments]     ${MaxPrice}
    Wait Until Page Contains Element    ${ClickMaxPrice}
    Click Element   ${ClickMaxPrice}
    WHILE    ${Status} == False
        # Check if target element exists after scrolling
        ${Status} =    Run Keyword And Return Status    Page Should Contain Text    ${MaxPrice}
        Sleep   1
        IF    ${Status} == True
                Run Keyword And Return      Click Element   ${TargetValue}
        END

        &{scrollGesture} =    Create Dictionary    height=${114}    width=${381}    left=${755}     top=${1194}   direction=down    percent=${1.5}
        Execute Script      mobile: scrollGesture    &{scrollGesture}
    END

Choose Bedroom Size
    Wait Until Page Contains Element    ${BedroomCategory}
    Repeat Keyword    6    Click Element    ${IncBedroomCountBtn}

Choose PropertyType
    Wait Until Page Contains Element    ${PropTypeLocator}
    Click Element    ${PropTypeLocator}
    Choose Residentail PropertyType

Choose Residentail PropertyType
    Click Element    ${ResidentialType}
    Sleep    2s

Click Results Button
    Click Element    ${ResultsButton}


