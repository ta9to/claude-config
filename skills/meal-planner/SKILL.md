---
name: meal-planner
description: 食材の買い物前に、直近の食事・栄養バランス・気分をもとに2〜3日分の献立を決定し、買い物リストを出力するスキル
metadata:
  tags: 献立, 食事計画, 栄養, 買い物リスト, 料理, 食材
---

## いつ使うか

ユーザーが食材を買いに行く前に「今日何を買えばいい？」「献立を決めたい」「買い物リストを作って」と言ったとき。

## 動作概要

対話形式で以下を順に確認し、最終的に2〜3日分の献立と買い物リストを出力する。

1. **コンテキスト収集** → 直近の食事内容・栄養の偏り・気分・人数・予算・調理可能時間を把握する
2. **栄養バランス分析** → 不足している栄養素や偏りを特定する
3. **献立決定** → 2〜3日分（朝・昼・夕）のメニューを提案・確定する
4. **買い物リスト出力** → カテゴリ別に整理された買い物リストを出力する

## ルール一覧

- [workflow.md](rules/workflow.md) — 全体の進行フロー
- [context-gathering.md](rules/context-gathering.md) — コンテキスト収集の質問と解釈
- [nutritional-analysis.md](rules/nutritional-analysis.md) — 栄養バランスの分析方法
- [meal-selection.md](rules/meal-selection.md) — 献立の選定と提案ルール
- [shopping-list.md](rules/shopping-list.md) — 買い物リストの整形と出力フォーマット
