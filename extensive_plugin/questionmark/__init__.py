from nonebot import on_regex
from nonebot.params import RegexGroup
from nonebot.exception import IgnoredException

__zx_plugin_name__ = "行为艺术 [Hidden]"
__plugin_version__ = 3.9
__plugin_author__ = "INSide_734"
__plugin_settings__ = {
    "level": 5,
    "default_status": True,
    "limit_superuser": False,
    "cmd": ["行为艺术"]
}

question = on_regex(r"^([?？¿!！¡\s]+)$", priority=5, block=False)


@question.handle()
async def _(rgx: tuple = RegexGroup()):
    if not rgx:
        raise IgnoredException
    mark = rgx[0]\
        .replace("¿", "d").replace("?", "¿").replace("？", "¿").replace("d", "?")\
        .replace("¡", "d").replace("!", "¡").replace("！", "¡").replace("d", "!")
    await question.send(mark)
