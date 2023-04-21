from .__main__ import *

__version__ = "0.1.2"
__zx_plugin_name__ = "站长工具"
__plugin_usage__ = """
usage：
    一些常用的站长工具
    指令：
        二维码解析 <附带或回复一张图片>
        二维码生成 <内容>
        ping <主机名>
        icp查询 <域名>
        拦截检测 <网址>
        sping <主机名> [节点数量]
        whois查询 <域名>
""".strip()
__plugin_des__ = "一些常用的站长工具"
__plugin_cmd__ = ["站长工具"]
__plugin_type__ = ("一些工具", )
__plugin_version__ = 1.2
__plugin_author__ = "INSide_734"
__plugin_settings__ = {
    "level": 5,
    "default_status": True,
    "limit_superuser": False,
    "cmd": ["站长工具"]
}