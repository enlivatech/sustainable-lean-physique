# 可持續薄肌手冊

好看、好用、練得久的身體——一本照著做就行的訓練與生活指南（繁體中文）。

**[下載 PDF：可持續薄肌手冊](可持續薄肌手冊.pdf)**（A4，18 頁，12 張圖）

![原版 vs 可持續版](原版vs可持續版.png)

## 這是什麼

「薄肌」指的是足夠的肌肉加上適中的體脂：穿衣顯瘦、脫衣有肉，不追求大塊頭。

這份手冊從邵艾倫 Alan 的影片〈[如何練出薄肌？訓練、飲食、減脂一次講透](https://www.youtube.com/watch?v=vQp8G-BHnI8)〉出發。原版抓重點的眼光很準（增肌加減脂、漸進超負荷、抓大放小），但目標偏向短期衝刺。這裡依照運動指南和研究改寫成能長期維持的版本：

- 體脂不追極低：男性常態 10–15%，10% 只在短期需要時壓一下。
- 每個肌群每週練 2 次、約 10 組，主項 6–10 下，每組留 1–3 下。
- 補上有氧（每週約 150 分鐘中等強度）、睡眠與恢復、爆發力、平衡、活動度。
- 飲食八成原型、兩成彈性，蛋白質 1.6–2.2 g/kg（過重用目標體重算）。
- 加入新手課表、疼痛紅綠燈、達標後的維持方法和心理警訊。

## 目錄

| 章 | 內容 |
| --- | --- |
| 開始之前 | 怎麼用這本手冊、運動前自評、疼痛紅綠燈 |
| 1 | 目標：薄肌是什麼、體脂參考、腰圍指標 |
| 2 | 六件事都要練，但比重不同 |
| 3 | 重量訓練：五個原則 |
| 4 | 選一套課表：新手全身、標準三練、進階四練 |
| 5 | 有氧與心肺 |
| 6 | 爆發力、活動度、平衡 |
| 7 | 一週怎麼排 |
| 8 | 飲食 |
| 9 | 睡眠與恢復 |
| 10 | 追蹤進度 |
| 11 | 長期維持與心態 |
| 附錄 | 一頁速查卡 |

## 檔案

| 檔案 | 說明 |
| --- | --- |
| `可持續薄肌手冊.pdf` | 手冊成品 |
| `原版vs可持續版.png` | 對比圖（2160×2700，適合社群分享） |
| `src/handbook.html` | 手冊原始檔，圖表都是內嵌 SVG |
| `src/comparison.html` | 對比圖原始檔 |
| `build.sh` | 用 Chrome 重新產生 PDF 和對比圖 |

改內容時改 `src/` 裡的 HTML，再執行 `./build.sh`。字型用 Windows 內建的微軟正黑體；其他系統會改用 Noto Sans TC。

## English

*Bó jī* (薄肌, literally "thin muscle") is the Chinese-internet term for a lean, athletic look: moderate muscle at a low-but-livable body fat, close to what English speakers call a *lean physique* or *swimmer's build*. This repo is a Traditional Chinese handbook that turns a popular short-term version of the idea into a sustainable plan: twice-weekly training per muscle, real cardio, sleep and recovery, flexible eating, and a maintenance phase.

## 聲明

本手冊是給一般成年人的健身指南，不取代醫療建議。有疾病、舊傷、懷孕或正在服藥，開始前先問醫生。

整理：AZ · 2026 年 10 月
