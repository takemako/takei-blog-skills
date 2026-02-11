#!/bin/bash
# タケイブログスキル インストーラー (Mac/Linux/WSL用)
# Usage: bash install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "==================================="
echo " タケイブログスキル インストーラー"
echo "==================================="
echo ""

# commands形式のインストール
echo "[1/2] commands形式をインストール中..."
mkdir -p "$CLAUDE_DIR/commands"
cp "$SCRIPT_DIR/commands/"*.md "$CLAUDE_DIR/commands/"
echo "  -> $CLAUDE_DIR/commands/ にコピー完了"

# skills形式のインストール
echo "[2/2] skills形式をインストール中..."
for skill_dir in "$SCRIPT_DIR/skills/"/*/; do
    skill_name=$(basename "$skill_dir")
    mkdir -p "$CLAUDE_DIR/skills/$skill_name"
    cp "$skill_dir"SKILL.md "$CLAUDE_DIR/skills/$skill_name/"
    echo "  -> $skill_name をインストール"
done

echo ""
echo "==================================="
echo " インストール完了!"
echo "==================================="
echo ""
echo "利用可能なコマンド:"
echo "  /outline [テーマ]        - アウトライン作成"
echo "  /rewrite                 - タケイスタイルにリライト"
echo "  /title-ideas [テーマ]    - タイトル候補を提示"
echo "  /seo-check               - SEOチェック"
echo "  /review-article [製品名] - レビュー記事作成"
echo ""
echo "Claude Codeを再起動してから使用してください。"
