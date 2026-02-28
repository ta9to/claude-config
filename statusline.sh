#!/bin/bash
# 忍者テーマのステータスライン

data=$(cat)

model=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('model',{}).get('display_name','?'))" 2>/dev/null || echo "?")
context_pct=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('context_window',{}).get('used_percentage',0))" 2>/dev/null || echo "0")
cost=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(f\"\${d.get('cost',{}).get('total_cost_usd',0):.3f}\")" 2>/dev/null || echo "0.000")
agent=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('agent',{}).get('name','naruto'))" 2>/dev/null || echo "naruto")

# 忍者アイコン選択
if [ "$agent" = "shikamaru" ]; then
    icon="🧠"
    label="参謀"
elif [ "$agent" = "sasuke" ]; then
    icon="👁"
    label="写輪眼"
else
    icon="🍥"
    label="ナルト"
fi

# コンテキスト使用量の警告
if [ "$context_pct" -gt 80 ] 2>/dev/null; then
    ctx_warning=" ⚠️印"
else
    ctx_warning=""
fi

echo "${icon} ${label} | ${model} | チャクラ:${context_pct}%${ctx_warning} | \$${cost}"
