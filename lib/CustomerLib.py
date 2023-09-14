"""
利用python实现一些方法
比如实现屏幕截图的生成目录
也可以参考：
https://blog.csdn.net/songpeiying/article/details/131572219
"""
import os
import time


# 类名和文件名保持一致
class CustomerLib(object):
    # 需求：在项目根目录下生成screenshots文件夹，并在文件夹下根据年月生成独立的文件夹，来存放对应年月的截图
    def genr_screenshots_path(self):
        # 项目根目录路径
        root_dir = os.path.dirname(os.path.dirname(__file__))
        '''
        os.path.join()函数：连接两个或更多的路径名组件
        1.如果各组件名首字母不包含’/’，则函数会自动加上
　　　　　2.如果有一个组件是一个绝对路径，则在它之前的所有组件均会被舍弃
        3.如果最后一个组件为空，则生成的路径以一个’/’分隔符结尾
        '''
        screenshots = os.path.join(root_dir,"screenshots")
        if not os.path.exists(screenshots):
            os.mkdir(screenshots)
        y_m = time.strftime("%Y_%m_%d")
        ym_dir = os.path.join(screenshots,y_m)
        if not os.path.exists(ym_dir):
            os.mkdir(ym_dir)
        return ym_dir


