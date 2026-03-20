*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait until element is ready then input text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait until page contains element then verify text
    [Arguments]    ${expexted_message}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain        ${expexted_message}

Wait until element is ready then select dropdown
    [Arguments]    ${dropdown_locator}    ${option_text}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${dropdown_locator}
    
    ${target_option}    Set Variable    xpath=//*[contains(@class, 'go5-dropdown-item')]//*[normalize-space()='${option_text}']
    
    Wait Until Element Is Visible    ${target_option}    timeout=5s
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${target_option}