"""從繁體中文原始檔產生简体中文版。

先用 OpenCC（tw2sp）轉字和常見詞，再套用下面的大陸用語對照表
（健身動作名稱、單位、引號等 OpenCC 不會處理或處理錯的地方）。

用法：python tools/zh_hans.py        （需要 pip install opencc）
"""
import pathlib
import opencc

ROOT = pathlib.Path(__file__).resolve().parent.parent

# 順序有關係：長的、特定的放前面。
TERMS = [
    # OpenCC 轉錯的
    ("内核", "核心"), ("指针", "指标"), ("自己的进程", "自己的行程"), ("进程打乱", "行程打乱"),
    ("高级四练", "进阶四练"), ("警讯", "警示"),
    # 標點
    ("「", "“"), ("」", "”"), ("〈", "《"), ("〉", "》"),
    # 單位
    ("公分", "厘米"), ("公克", "克"), ("公尺", "米"),
    # 動作名稱
    ("窄握伏地挺身", "窄距俯卧撑"), ("伏地挺身", "俯卧撑"), ("双杠撑体", "双杠臂屈伸"), ("三头伸展", "三头臂屈伸"),
    ("滑轮下拉", "高位下拉"), ("前蹲举", "前蹲"), ("腿推", "腿举"), ("硬举", "硬拉"), ("棒式", "平板支撑"),
    ("死虫", "死虫式"), ("农夫走路", "农夫行走"), ("过头砸球", "过顶砸球"), ("飞轮冲刺", "动感单车冲刺"),
    ("单脚", "单腿"), ("世界最伟大伸展", "世界最伟大拉伸"), ("伸展", "拉伸"), ("柔软度", "柔韧性"),
    # 訓練用語
    ("卡关怎么办", "遇到瓶颈怎么办"), ("连续卡关", "连续停滞"), ("卡关", "瓶颈"),
    ("配件是", "辅助动作是"), ("配件：", "辅助动作："), ("用在配件", "用在辅助动作"), ("配件", "辅助"),
    ("心跳", "心率"),
    # 飲食
    ("无糖优格", "无糖酸奶"), ("优格", "酸奶"), ("便当", "盒饭"), ("白饭", "米饭"), ("地瓜", "红薯"),
    ("马铃薯", "土豆"), ("酪梨", "牛油果"), ("原型食物", "天然食物"), ("八成原型", "八成天然"), ("品项", "名称"),
    # 其他用語
    ("外型", "外形"), ("吐气", "呼气"), ("网络可免费取得", "网上可以免费获取"), ("一起订", "一起制定"),
    # 檔名與語言
    ('lang="zh-Hant-TW"', 'lang="zh-Hans-CN"'),
    ('"Microsoft JhengHei","Noto Sans TC"', '"Microsoft YaHei","PingFang SC","Noto Sans SC"'),
    ('"Microsoft JhengHei",sans-serif', '"Microsoft YaHei",sans-serif'),
]


def convert(text: str) -> str:
    text = opencc.OpenCC("tw2sp").convert(text)
    for a, b in TERMS:
        text = text.replace(a, b)
    return text


def main() -> None:
    src, dst = ROOT / "src" / "zh-Hant", ROOT / "src" / "zh-Hans"
    dst.mkdir(parents=True, exist_ok=True)
    for f in src.glob("*.html"):
        (dst / f.name).write_text(convert(f.read_text(encoding="utf-8")), encoding="utf-8")
        print("wrote", dst / f.name)


if __name__ == "__main__":
    main()
