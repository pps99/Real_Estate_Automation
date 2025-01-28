*** Settings ***
Library     AppiumLibrary
Library    String

*** Variables ***
${ForSaleButton} =      xpath=//android.widget.TextView[@text="For Sale"]
${BedroomCategory} =    xpath=//android.widget.TextView[@text="Bedrooms"]
${IncBedroomCountBtn} =     xpath=//android.widget.Button[@content-desc="Increase bedroom count"]
${PropTypeLocator} =    xpath=//android.view.ViewGroup[@content-desc="Property type"]
${ResultsButton} =      id=x:id/page.property_search.search_button
${ClickMaxPrice} =      id=x:id/filters.range.max_dropdown
${DropdownScrollView} =       id=x:id/dropdown.scrollview

${BedroomSizeText} =          xpath=(//android.widget.TextView[@resource-id="x:id/options_sequence.value"])[1]
${Status} =     False

*** Keywords ***
Search By Categories
    [Arguments]     ${MaxPrice}     ${PropertyType}     ${BedroomSize}
    Click For Sale Button
    Scroll and Select Value     ${MaxPrice}
    Choose Bedroom Size         ${BedroomSize}
    Choose PropertyType         ${PropertyType}
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
        Sleep   1
        ${Status} =    Run Keyword And Return Status    Page Should Contain Text    ${MaxPrice}
        ${TargetValue}  Set Variable        xpath=//android.view.ViewGroup[@content-desc="${MaxPrice}"]
        IF    ${Status} == True
                Run Keyword And Return      Click Element   ${TargetValue}
        END

        &{scrollGesture} =    Create Dictionary    height=${114}    width=${381}    left=${755}     top=${1194}   direction=down    percent=${1.5}
        Execute Script      mobile: scrollGesture    &{scrollGesture}
    END

Choose Bedroom Size
    [Arguments]     ${BedroomSize}
    Wait Until Page Contains Element    ${BedroomCategory}
    ${Size} =   Get Element Attribute    ${BedroomSizeText}    text
    WHILE    '${Size}' != '${BedroomSize}'
         Increase Bed Room
         ${Size} =  Get Element Attribute    ${BedroomSizeText}    text
    END


Increase Bed Room
    Click Element    ${IncBedroomCountBtn}

Choose PropertyType
    [Arguments]     ${PropertyType}
    Wait Until Page Contains Element    ${PropTypeLocator}
    Click Element    ${PropTypeLocator}
    Choose Residentail PropertyType     ${PropertyType}

Choose Residentail PropertyType
    [Arguments]     ${PropertyType}
    ${ResidentialType}  Set Variable   xpath=//android.view.ViewGroup[@content-desc="x:id/${PropertyType}.deselected"]
    Click Element    ${ResidentialType}
    Sleep    2s

Click Results Button
    Click Element    ${ResultsButton}


