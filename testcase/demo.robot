*** Settings ***
Library     SeleniumLibrary

# 定义变量
*** Variables ***
${URL}          https://www.baidu.com/
${USER_NAME}    18883245086
${PASSWORD}     EB1019ebd11
*** Keywords ***
phonenum&passwd-login
	# 用例操作步骤
    Open Browser    ${URL}      browser=chrome
    # 最大化窗口
    Maximize Browser Window
    Wait Until Page Contains Element    kw
    Input Text      kw             csdn
    Click Button    su
    Wait Until Page Contains Element    xpath://*[@id="1"]/div/div[1]/h3/a[1]
    Click Link      xpath://*[@id="1"]/div/div[1]/h3/a[1]

# 测试用例
*** Test Cases ***
# 用例标题
登录csdn
	# 自动以关键字使用时直接引用即可，并且多个用例可复用
    phonenum&passwd-login
    # 切换新窗口
    switch window    NEW
    # 获取新窗口的title并赋值给变量：Returns the title of the current page.
    ${title}    Get Title
    Should Be Equal    ${title}    CSDN - 专业开发者社区    页面错误
    Wait Until Page Contains Element    xpath:/html/body/div[1]/div/div/div/div[3]/div/div[1]/a
    Click Element        xpath:/html/body/div[1]/div/div/div/div[3]/div/div[1]/a
    Sleep    1
    # 切换frame
    select frame    xpath://*[@id="passportbox"]/iframe
    Wait Until Page Contains Element    xpath:/html/body/div/div/div/div[2]/div[2]/div[1]/div[1]/span[4]
    Click Element    xpath:/html/body/div/div/div/div[2]/div[2]/div[1]/div[1]/span[4]
    Wait Until Page Contains Element    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/input
    Input Text    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/input    ${USER_NAME}
    Input Password    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[2]/div/input  ${PASSWORD}
    Click Button    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[4]/button
    Click Element    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/p/i
    Click Button    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[4]/button






