*** Settings ***
Library        SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
user Register to Empeo platform with ${companyname}, ${companydetail}, ${userdetail}, ${email}, ${name},${lastname}, ${phone}, ${Promo Code}
    CommonKeywords.Wait until element is ready then click element    xpath=//label[contains(text(), 'อื่นๆ')]
    CommonKeywords.Wait until element is ready then input text    xpath=//input[@placeholder="ชื่อบริษัท*"]    ${companyname}
    CommonKeywords.Wait until element is ready then select dropdown    xpath=//go5-dropdown-selection[@data-testid="dropdown_selection_registration_company_type"]    ${companydetail}
    CommonKeywords.Wait until element is ready then select dropdown    xpath=//go5-dropdown-selection[@data-testid="dropdown_selection_registration_user_amount"]    ${userdetail}
    CommonKeywords.Wait until element is ready then input text       xpath=//input[@placeholder="อีเมล*"]        ${email}
    CommonKeywords.Wait until element is ready then input text       xpath=//input[@placeholder="ชื่อ*"]     ${name}
    CommonKeywords.Wait until element is ready then input text       xpath=//input[@placeholder="นามสกุล*"]     ${lastName}
    CommonKeywords.Wait until element is ready then input text       xpath=//input[@placeholder="เบอร์มือถือ*"]     ${phone}
    CommonKeywords.Wait until element is ready then click element    xpath=//span[contains(text(), 'ใช้โค้ดส่วนลด')] 
    CommonKeywords.Wait until element is ready then input text       xpath=//input[@placeholder="รหัสส่วนลด"]    ${Promo Code}    
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@data-testid="input_checkbox_registration_checkbox"]
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@data-testid="button_submit_registration_try_for_free"]



user create password with ${password}
    CommonKeywords.Wait until element is ready then input text    xpath=//input[@placeholder="รหัสผ่าน"]    ${password}
    CommonKeywords.Wait until element is ready then input text    xpath=//input[@placeholder="ยืนยันรหัสผ่าน"]    ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@data-testid="button_button_create_password_btn_next"]

Get Start Empeo
    CommonKeywords.Wait until element is ready then click element    xpath=//span[@data-testid="button_text_create_password_btn_lets_get_started"]


Login Empeo with ${email}, ${password}
    CommonKeywords.Wait until element is ready then input text    xpath=//input[@placeholder="Email"]        ${email}
    CommonKeywords.Wait until element is ready then input text    xpath=//input[@placeholder="Password"]        ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="byEmail"]

Agree policy
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="checkbox"]
    CommonKeywords.Wait until element is ready then click element    xpath=//span[@data-testid="button_text_button_button_pdpa_pdpa"]
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="checkbox"]
    CommonKeywords.Wait until element is ready then click element    xpath=//span[@data-testid="button_text_button_button_pdpa_pdpa"]

Wait for OTP to expire and then input ${OTP}
    Log To Console    Waiting for OTP to expire (30s)...
    Sleep    35s
    CommonKeywords.Wait until element is ready then click element    xpath=//input[starts-with(@id, 'otp_0')]
    Press Keys    None    ${OTP}
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@data-testid="button_button_registration_verify"]



Input OTP Code ${OTP}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[starts-with(@id, 'otp_0')]
    Press Keys    None    ${OTP}
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@data-testid="button_button_registration_verify"]



Website should be display notify as "${expexted_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expexted_message}
