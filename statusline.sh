#!/bin/bash
# JBMARステータスライン

data=$(cat)

model=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('model',{}).get('display_name','?'))" 2>/dev/null || echo "?")
context_pct=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('context_window',{}).get('used_percentage',0))" 2>/dev/null || echo "0")
cost=$(echo "$data" | python3 -c "import sys,json; d=json.load(sys.stdin); print(f\"\${d.get('cost',{}).get('total_cost_usd',0):.3f}\")" 2>/dev/null || echo "0.000")

# コンテキスト使用量の警告
if [ "$context_pct" -gt 80 ] 2>/dev/null; then
    ctx_warning=" ⚠️"
else
    ctx_warning=""
fi

echo "🤖 JBMAR | ${model} | CTX:${context_pct}%${ctx_warning} | \$${cost}"
