*** Settings ***
Documentation    验证suite setup or teardown
Resource    ../keywords/useraction1.resource

Suite Setup    登录到csdn输入帐密界面    xpath://*[@id="1"]/div/div[1]/h3/a[1]   CSDN - 专业开发者社区
Suite Teardown    关闭浏览器
Test Setup    屏幕截图
Test Teardown    屏幕截图

*** Test Cases ***
正确帐密登录
	登录测试    18883245086     eb1019EBD11
	断言登录成功/失败信息     1

错误帐密测试
#	[Setup]    屏幕截图
	登录测试    18883245086     eb1019EBD10
	断言登录成功/失败信息     1
#	[Teardown]    屏幕截图
