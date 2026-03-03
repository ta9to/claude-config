#!/bin/bash
# Claude Code設定の同期スクリプト
# git pull 後にこれを実行して設定をClaude Codeに反映する

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "=== Claude Config Sync ==="
echo "Repo: $REPO_DIR"

# CLAUDE.md → ~/CLAUDE.md
cp "$REPO_DIR/CLAUDE.md" "$HOME/CLAUDE.md"
echo "✓ CLAUDE.md"

# statusline.sh → ~/.claude/statusline.sh
cp "$REPO_DIR/statusline.sh" "$CLAUDE_DIR/statusline.sh"
chmod +x "$CLAUDE_DIR/statusline.sh"
echo "✓ statusline.sh"

# skills
mkdir -p "$CLAUDE_DIR/skills"
for skill_dir in "$REPO_DIR/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  cp -r "$skill_dir" "$CLAUDE_DIR/skills/$skill_name"
  echo "✓ skills/$skill_name"
done

echo ""
echo "同期完了。settings.jsonは手動でマージしてください: $CLAUDE_DIR/settings.json"
