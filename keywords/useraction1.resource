*** Settings ***

Documentation    用户登录注册
Library    SeleniumLibrary
# 引用CustomerLib.py定义的方法
Library    ../lib/CustomerLib.py


*** Variables ***
# 这是新建变量，是把一个确定的值赋值给变量，所以要放在屏幕截图关键字中
${URL}  https://www.baidu.com/
${browser}  chrome
#${snapshot_dir}     Get Screenshots Path
*** Keywords ***
登录到csdn输入帐密界面
	[Arguments]    ${link_text}     ${expect_result1}
	# 用例操作步骤
    Open Browser    ${URL}      ${browser}
    # 最大化窗口
    Maximize Browser Window
    Wait Until Page Contains Element    kw
    Input Text      kw             csdn
    Click Button    su
# 自定义带参数的关键字--作用：封装实现参数化，在不同的用例里调用传不同参数即可
	Wait Until Page Contains Element    ${link_text}
    Click Link      ${link_text}
	switch window    NEW
	# 获取新窗口的title并赋值给变量：Returns the title of the current page.
    ${title}    Get Title
    Should Be Equal    ${title}    ${expect_result1}    页面加载错误
    Wait Until Page Contains Element    xpath:/html/body/div[1]/div/div/div/div[3]/div/div[1]/a
    Click Element        xpath:/html/body/div[1]/div/div/div/div[3]/div/div[1]/a
    Sleep    1
    # 切换frame
    select frame    xpath://*[@id="passportbox"]/iframe
    Wait Until Page Contains Element    xpath:/html/body/div/div/div/div[2]/div[2]/div[1]/div[1]/span[4]
    Click Element    xpath:/html/body/div/div/div/div[2]/div[2]/div[1]/div[1]/span[4]
登录测试
	[Arguments]    ${username}     ${password}
    Wait Until Page Contains Element    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/input
	Input Text    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/input    ${username}
    Input Password    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[2]/div/input  ${password}
    Click Element    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/p/i
    Click Button    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[4]/button
# 想表达的意思就是登录成功/失败后断言信息，接口测试这么做很常用
断言登录成功/失败信息
	[Arguments]    ${expect_result}
	Should Be Equal    1    ${expect_result}

屏幕截图
	# report和screenshots文件夹中看到
	${snapshot_dir}=    Genr Screenshots Path
	Set Screenshot Directory    path=${snapshot_dir}
	Capture Page Screenshot
关闭浏览器
	Close Browser
