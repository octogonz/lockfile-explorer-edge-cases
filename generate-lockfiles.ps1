# Stop immediately on any error
$ErrorActionPreference = "Stop"

Write-Host "==> Installing PNPM CLI..."
cd pnpm-cli
pnpm install

cd ..

Write-Host "Deleting old lockfiles..."
del pnpm-lock.yaml, pnpm-lock-5.4.yaml, pnpm-lock-6.0.yaml, pnpm-lock-9.0.yaml -Force -ErrorAction SilentlyContinue

Write-Host "Deleting node_modules..."
rd node_modules -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n==> Generating pnpm-lock-5.4.yaml"
& "pnpm-cli/pnpm7/node_modules/.bin/pnpm" install
move -Force pnpm-lock.yaml pnpm-lock-5.4.yaml

Write-Host "Deleting node_modules..."
rd node_modules -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n==> Generating pnpm-lock-9.0.yaml"
& "pnpm-cli/pnpm10/node_modules/.bin/pnpm" install
move -Force pnpm-lock.yaml pnpm-lock-9.0.yaml

Write-Host "Deleting node_modules..."
rd node_modules -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n==> Generating pnpm-lock-6.0.yaml"
& "pnpm-cli/pnpm8/node_modules/.bin/pnpm" install
move -Force pnpm-lock.yaml pnpm-lock-6.0.yaml
