# 工时打卡 · 一键更新上线
# 用法：在项目目录执行  .\deploy.ps1 "可选的提交说明"
Set-Location $PSScriptRoot

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
    if ($args.Count -gt 0) { $msg = $args -join ' ' }
    else { $msg = 'update: ' + (Get-Date -Format 'yyyy-MM-dd HH:mm') }
    git commit -m $msg
} else {
    Write-Host 'No changes to commit.'
}

git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host 'Push failed.' -ForegroundColor Red
    exit 1
}
Write-Host 'Published: https://whale47-x.github.io/work-hour/'