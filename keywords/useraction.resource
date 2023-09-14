*** Settings ***
# 建立resource的目的是，如果把自定义的关键字和变量都放在测试用例里，如果用例数量非常多，会非常难以维护；
# 我们可以专门建一个resource来存放/封装这些自定义或者说常用的关键字和变量，可以理解是环境变量
# 此时再看test_user_login.robot编写用例就非常简洁明了
# 而且通过这种方式，即可以使用不同变量的值创建不同的用例，类似于接口的容错和异常处理测试
# 所以对于robotframework而言，首先不可能把所有的变量和自定义关键字都放在测试用例里，就可以使用resource
# 类似接口自动化的参数化数据 or 公共基础方法封装 or 把基础的数据放在conftest.py中，需要的时候拿出来即可
# 引用面试话术的一句话，我们的测试用例只是用来存放用例的
Documentation    用户登录注册
Library    SeleniumLibrary

*** Variables ***
${URL}  https://www.baidu.com/
*** Keywords ***
通过百度页面跳转到csdn首页
	# 用例操作步骤
    Open Browser    ${URL}      browser=chrome
    # 最大化窗口
    Maximize Browser Window
    Wait Until Page Contains Element    kw
    Input Text      kw             csdn
    Click Button    su
# 自定义带参数的关键字--作用：封装实现参数化，在不同的用例里调用传不同参数即可
点击链接并跳转
	[Arguments]    ${link_text}
	Wait Until Page Contains Element    ${link_text}
    Click Link      ${link_text}
断言新窗口title
	[Arguments]    ${expect_result}
	switch window    NEW
	# 获取新窗口的title并赋值给变量：Returns the title of the current page.
    ${title}    Get Title
    Should Be Equal    ${title}    ${expect_result}    页面加载错误
点击登录
    Wait Until Page Contains Element    xpath:/html/body/div[1]/div/div/div/div[3]/div/div[1]/a
    Click Element        xpath:/html/body/div[1]/div/div/div/div[3]/div/div[1]/a
    Sleep    1
    # 切换frame
    select frame    xpath://*[@id="passportbox"]/iframe
    Wait Until Page Contains Element    xpath:/html/body/div/div/div/div[2]/div[2]/div[1]/div[1]/span[4]
    Click Element    xpath:/html/body/div/div/div/div[2]/div[2]/div[1]/div[1]/span[4]
    Wait Until Page Contains Element    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/input
使用不同帐密登录
	[Arguments]    ${username}     ${password}
	Input Text    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/input    ${username}
    Input Password    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[2]/div/input  ${password}
    Click Element    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/p/i
    Click Button    xpath:/html/body/div/div/div/div[2]/div[2]/div/div[2]/div/div[4]/button
# 想表达的意思就是登录成功/失败后断言信息，接口测试这么做很常用
断言登录成功/失败信息
	[Arguments]    ${expect_result}
	Should Be Equal    1    ${expect_result}
关闭浏览器
	Close Browser