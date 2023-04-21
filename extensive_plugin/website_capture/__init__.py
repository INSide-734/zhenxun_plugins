from .__main__ import *

__version__ = "0.2.3"
__zx_plugin_name__ = "网页截图"
__plugin_usage__ = """
usage：
    使用 playwright 对给定的网页进行截图
    指令：
        网页截图 [参数] <URL>
    参数:
        --delay/-d 【可选】截图延时（单位：秒），默认值：5
        --width/-wd 【可选】页面宽度，默认值：1280
        --height/-hi 【可选】页面高度，默认值：720
    示例：
       网页截图 baidu.com
       网页截图 -d 0 baidu.com
""".strip()
__plugin_des__ = "网页截图"
__plugin_cmd__ = ["网页截图"]
__plugin_type__ = ("一些工具", )
__plugin_version__ = 2.3
__plugin_author__ = "INSide_734"
__plugin_settings__ = {
    "level": 5,
    "default_status": True,
    "limit_superuser": False,
    "cmd": ["网页截图"]
}