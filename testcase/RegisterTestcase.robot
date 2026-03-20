*** Settings ***
Library        SeleniumLibrary
Resource        ../keywords/Registerkeywords.robot
Variables       ../resources/config/config.yaml
Variables       ../resources/testdata/testdata.yaml
Suite Setup        Open Browser    ${baseUrl}    chrome
Suite Teardown        Close Browser
Test Setup       Go To           ${baseUrl}


*** Test Cases ***
1.Register Deny with invalid Email
    [Documentation]    ตรวจสอบการกรอกอีเมลผิดรูปแบบ
    When user Register to Empeo platform with ${companyname}, ${companydetail}, ${userdetail}, ${invalidEmail}, ${name}, ${lastname}, ${validphone}, ${validPromo Code}  
    Then Website should be display notify as "กรุณาใส่อีเมลที่ถูกต้อง"




2.Register Deny with invalid name-lastname 
    [Documentation]    ตรวจสอบการกรอกชื่อเป็นอักษรพิเศษ
    When user Register to Empeo platform with ${companyname}, ${companydetail}, ${userdetail}, ${email}, ${invalidname}, ${lastname}, ${validphone}, ${validPromo Code}  
    Then Website should be display notify as "กรุณาใส่ชื่อที่ถูกต้อง"




3.Register Deny with invalid phone
    [Documentation]    ตรวจสอบการกรอกเบอร์โทรผิดรูปแบบ
    When user Register to Empeo platform with ${companyname}, ${companydetail}, ${userdetail}, ${email}, ${name}, ${lastname}, ${invalidphone}, ${validPromo Code}  
    Then Website should be display notify as "รูปแบบเบอร์โทรศัพท์ไม่ถูกต้อง"




4.valid credential but OTP to expire
    [Documentation]    ตรวจสอบการสมัครสมาชิกโดย OTP หมดอายุ
    When user Register to Empeo platform with ${companyname2}, ${companydetail}, ${userdetail}, ${email}, ${name}, ${lastname}, ${validphone}, ${validPromo Code}  
    And Wait for OTP to expire and then input ${validOTP}
    Then Website should be display notify as "OTP หมดอายุ"




5.Register success with valid credential
    [Documentation]    ตรวจสอบการสมัครสมาชิกสำเร็จด้วยข้อมูลที่ถูกต้อง
    When user Register to Empeo platform with ${companyname}, ${companydetail}, ${userdetail}, ${email}, ${name}, ${lastname}, ${validphone}, ${validPromo Code}  
    And Input OTP Code ${validOTP}
    Then Website should be display notify as "กรุณาตั้งรหัสผ่าน"
    And user create password with ${password}
    Then Get Start Empeo
    And Login Empeo with ${email}, ${password}
    Then Agree policy
    And Website should be display notify as "Welcome to empeo!"




6.Register with information already been used
    [Documentation]    ตรวจสอบการสมัครสมาชิกด้วยบริษัทที่สร้างบัญชีไปแล้ว
    When user Register to Empeo platform with ${companyname}, ${companydetail}, ${userdetail}, ${email2}, ${name}, ${lastname}, ${validphone}, ${validPromo Code}  
    And Website should be display notify as "บริษัทนี้มีบัญชีใช้งานแล้ว"
 



7.valid credential but the promo code was used repeatedly 
    [Documentation]    ตรวจสอบการสมัครสมาชิกด้วยPromocodeที่ใช้ไปแล้ว
    When user Register to Empeo platform with ${companyname3}, ${companydetail}, ${userdetail}, ${email3}, ${name}, ${lastname}, ${validphone}, ${validPromo Code}  
    And Website should be display notify as "Promocode ถูกใช้แล้ว"




8.valid credential but promocode was incorrect
    [Documentation]    ตรวจสอบการสมัครสมาชิกด้วยPromocodeที่ผิด
    When user Register to Empeo platform with ${companyname4}, ${companydetail}, ${userdetail}, ${email2}, ${name}, ${lastname}, ${validphone}, ${invalidPromo Code}  
    And Input OTP Code ${validOTP}
    Then Website should be display notify as "Promocode ผิด"



