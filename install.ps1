# タケイブログスキル インストーラー (Windows PowerShell用)
# Usage: powershell -ExecutionPolicy Bypass -File install.ps1

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"

Write-Host "===================================" -ForegroundColor Cyan
Write-Host " タケイブログスキル インストーラー" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

# commands形式のインストール
Write-Host "[1/2] commands形式をインストール中..." -ForegroundColor Yellow
$CommandsDir = Join-Path $ClaudeDir "commands"
New-Item -ItemType Directory -Force -Path $CommandsDir | Out-Null
Copy-Item "$ScriptDir\commands\*.md" -Destination $CommandsDir -Force
Write-Host "  -> $CommandsDir にコピー完了" -ForegroundColor Green

# skills形式のインストール
Write-Host "[2/2] skills形式をインストール中..." -ForegroundColor Yellow
$SkillsSource = Join-Path $ScriptDir "skills"
Get-ChildItem -Path $SkillsSource -Directory | ForEach-Object {
    $SkillName = $_.Name
    $DestDir = Join-Path $ClaudeDir "skills\$SkillName"
    New-Item -ItemType Directory -Force -Path $DestDir | Out-Null
    Copy-Item "$($_.FullName)\SKILL.md" -Destination $DestDir -Force
    Write-Host "  -> $SkillName をインストール" -ForegroundColor Green
}

Write-Host ""
Write-Host "===================================" -ForegroundColor Cyan
Write-Host " インストール完了!" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "利用可能なコマンド:" -ForegroundColor White
Write-Host "  /outline [テーマ]        - アウトライン作成"
Write-Host "  /rewrite                 - タケイスタイルにリライト"
Write-Host "  /title-ideas [テーマ]    - タイトル候補を提示"
Write-Host "  /seo-check               - SEOチェック"
Write-Host "  /review-article [製品名] - レビュー記事作成"
Write-Host ""
Write-Host "Claude Codeを再起動してから使用してください。" -ForegroundColor Yellow
