*** Settings ***
Library     AppiumLibrary
Library    String

*** Variables ***
${NumberOfBedRooms} =   id=x:id/page.property_details.summary.bedrooms.value
${Price} =              id=x:id/page.property_details.summary.sale_price
${ContactRelator} =     id=x:id/page.property_details.contact_realtor_button
${SalesPersonName} =   id=x:id/view.realtor_information.card.name.text
${GetInTouchLocator} =      id=x:id/view.realtor_information.card.organization.contact.text
${PhoneNumberLocator} =     id=x:id/view.realtor_information.card.organization.phone.text

*** Keywords ***
Verify The Details Of Search Result
    Verify BedRooms
    Verify Price
    Click Contact Realtor
    Click Get In Touch

Verify BedRooms
    ${bedrooms_count} =     Get Element Attribute    ${NumberOfBedRooms}    text
    IF    ${bedrooms_count} < 3
        Fail    msg=The Search Criteria Does Not Satisfy
    END

Verify Price
    ${price} =      Get Element Attribute    ${Price}    text
    ${price} =      Replace String    ${price}    $    ${EMPTY}
#    IF    ${price} < 800,000
#         Fail   msg=The Search Criteria Does Not Satisfy
#    END

Click Contact Realtor
    Wait Until Page Contains Element    ${ContactRelator}
    Click Element    ${ContactRelator}
    Get Sales Person Name

Get Sales Person Name
    Wait Until Page Contains Element    ${SalesPersonName}
    ${salesperson} =    Get Element Attribute    ${SalesPersonName}    text
    Log To Console    ${salesperson}

Click Get In Touch
    Wait Until Page Contains Element    ${GetInTouchLocator}
    Click Element    ${GetInTouchLocator}
    Wait Until Page Contains Element    ${PhoneNumberLocator}
    ${phonenumber} =    Get Element Attribute    ${PhoneNumberLocator}    text
    Log To Console    ${phonenumber}

