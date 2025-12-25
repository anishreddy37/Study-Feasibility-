# Start script for StudyFeasible
# Usage: .\start.ps1 -DatabaseUrl "your-connection-string"

param(
    [Parameter(Mandatory=$false)]
    [string]$DatabaseUrl
)

Write-Host "`n=== Starting StudyFeasible ===" -ForegroundColor Cyan
Write-Host ""

# Check if DATABASE_URL is provided as parameter
if ($DatabaseUrl) {
    $env:DATABASE_URL = $DatabaseUrl
    Write-Host "Using provided DATABASE_URL" -ForegroundColor Green
}

# Check if DATABASE_URL is set
if (-not $env:DATABASE_URL) {
    Write-Host "ERROR: DATABASE_URL is not set!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please provide it as a parameter:" -ForegroundColor Yellow
    Write-Host "  .\start.ps1 -DatabaseUrl 'postgresql://user:pass@host/db'" -ForegroundColor White
    Write-Host ""
    Write-Host "Or set it as an environment variable:" -ForegroundColor Yellow
    Write-Host "  `$env:DATABASE_URL = 'postgresql://user:pass@host/db'" -ForegroundColor White
    Write-Host "  .\start.ps1" -ForegroundColor White
    Write-Host ""
    Write-Host "Quick setup: Get free PostgreSQL at https://neon.tech" -ForegroundColor Cyan
    exit 1
}

# Set NODE_ENV
$env:NODE_ENV = "development"

Write-Host "Step 1: Pushing database schema..." -ForegroundColor Cyan
npm run db:push
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to push schema. Check your DATABASE_URL." -ForegroundColor Red
    exit 1
}
Write-Host "Schema ready!" -ForegroundColor Green
Write-Host ""

Write-Host "Step 2: Starting server..." -ForegroundColor Cyan
Write-Host "Server: http://localhost:5000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

npm run dev

