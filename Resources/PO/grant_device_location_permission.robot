*** Settings ***
Library     AppiumLibrary

*** Variables ***
${Device_Location_Header} =       xpath=//android.widget.LinearLayout[@resource-id="com.android.permissioncontroller:id/content_container"]/android.widget.LinearLayout
${Permission_Allow_Button} =       //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_foreground_only_button"]

*** Keywords ***
Gave Permission To Access Device Location
    Wait Until Page Contains Element     ${Device_Location_Header}
    Click Element    ${Permission_Allow_Button}

    