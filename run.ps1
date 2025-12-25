# Run script for Study-Feasibility
# This script helps you run the application with the correct environment variables

Write-Host "Study-Feasibility Run Script" -ForegroundColor Cyan
Write-Host "============================" -ForegroundColor Cyan
Write-Host ""

# Check if DATABASE_URL is already set
if ($env:DATABASE_URL) {
    Write-Host "DATABASE_URL is already set." -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "DATABASE_URL is not set." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please enter your PostgreSQL connection string:" -ForegroundColor Yellow
    Write-Host "Example: postgresql://user:password@host:5432/database" -ForegroundColor Gray
    Write-Host ""
    $dbUrl = Read-Host "DATABASE_URL"
    
    if ([string]::IsNullOrWhiteSpace($dbUrl)) {
        Write-Host "DATABASE_URL is required. Exiting." -ForegroundColor Red
        exit 1
    }
    
    $env:DATABASE_URL = $dbUrl
    Write-Host ""
}

# Set NODE_ENV
$env:NODE_ENV = "development"

Write-Host "Starting development server..." -ForegroundColor Green
Write-Host "Server will be available at http://localhost:5000" -ForegroundColor Green
Write-Host ""

# Run the dev server directly with tsx to avoid Windows compatibility issues
npx tsx server/index.ts

