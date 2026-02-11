# タケイブログスキル for Claude Code

Chromebook大全・ジャーナルのブログ記事作成をサポートするClaude Code用スキルパック。

## スキル一覧

| コマンド | 機能 |
|---------|------|
| `/outline テーマ名` | 記事のアウトライン（構成案）を作成 |
| `/rewrite` | 文章をタケイスタイルにリライト |
| `/title-ideas テーマ名` | タイトル候補を5パターン提示 |
| `/seo-check` | 記事をSEO観点で80点満点採点 |
| `/review-article 製品名` | 実機レビュー形式の記事を作成 |

## インストール方法

### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

### Mac / Linux / WSL

```bash
bash install.sh
```

### 手動インストール

`commands/` フォルダの中身を `~/.claude/commands/` にコピーしてください。

```bash
cp commands/*.md ~/.claude/commands/
```

## インストール後

Claude Codeを再起動すると、`/outline` などのコマンドが使えるようになります。

## ファイル構成

```
takei-blog-skills/
├── README.md
├── install.sh          # Mac/Linux用インストーラー
├── install.ps1         # Windows用インストーラー
├── commands/           # commands形式（従来型・確実に動作）
│   ├── outline.md
│   ├── rewrite.md
│   ├── title-ideas.md
│   ├── seo-check.md
│   └── review-article.md
└── skills/             # skills形式（新型・高機能）
    ├── outline/SKILL.md
    ├── rewrite/SKILL.md
    ├── title-ideas/SKILL.md
    ├── seo-check/SKILL.md
    └── review-article/SKILL.md
```

## タケイスタイルとは

- カジュアルで親近感のある語り口
- 「実際に〇〇してみて感じた」実体験ベース
- 「神」「最強」などインパクトワードを適度に使用
- 一文60文字程度で読みやすく
- 数字と具体性で説得力を出す

## 関連サイト

- [Chromebook大全](https://chromebookguide.net)
- [Chromebookジャーナル](https://chromebookguide.net/journal/)
