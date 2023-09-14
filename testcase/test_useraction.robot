*** Settings ***
Documentation    测试用户登录
# 获取相对路径
Resource    ../keywords/useraction.resource
Suite Setup    通过百度页面跳转到csdn首页
Suite Teardown    关闭浏览器


*** Test Cases ***
正常登录
    点击链接并跳转    xpath://*[@id="1"]/div/div[1]/h3/a[1]
    断言新窗口title  CSDN - 专业开发者社区
    点击登录
    # 变量可以不写变量名，也可以写如下，注意不包括${}
    # 当username为空时，可以使用${EMPTY}
    使用不同帐密登录    username=18883245086     password=eb1019EBD11
    断言登录成功/失败信息     1
#    Close Browser
密码错误登录
    点击链接并跳转    xpath://*[@id="1"]/div/div[1]/h3/a[1]
    断言新窗口title  CSDN - 专业开发者社区
    点击登录
    使用不同帐密登录    18883245086     eb1019EBD10
    断言登录成功/失败信息     2