# Quick Start Script for StudyFeasible
# This script helps you get started quickly

Write-Host "`n=== StudyFeasible Quick Start ===" -ForegroundColor Cyan
Write-Host ""

# Check if DATABASE_URL is set
if (-not $env:DATABASE_URL) {
    Write-Host "DATABASE_URL is not set." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Quick Setup Options:" -ForegroundColor Green
    Write-Host "1. Free Cloud PostgreSQL (Recommended):" -ForegroundColor White
    Write-Host "   - Go to https://supabase.com or https://neon.tech" -ForegroundColor Gray
    Write-Host "   - Sign up (free)" -ForegroundColor Gray
    Write-Host "   - Create a project" -ForegroundColor Gray
    Write-Host "   - Copy the connection string" -ForegroundColor Gray
    Write-Host ""
    Write-Host "2. Local PostgreSQL:" -ForegroundColor White
    Write-Host "   - Install PostgreSQL from https://www.postgresql.org/download/" -ForegroundColor Gray
    Write-Host "   - Create database: createdb studyfeasibility" -ForegroundColor Gray
    Write-Host "   - Use: postgresql://postgres:YOUR_PASSWORD@localhost:5432/studyfeasibility" -ForegroundColor Gray
    Write-Host ""
    
    $dbUrl = Read-Host "Enter your PostgreSQL DATABASE_URL (or press Enter to exit)"
    
    if ([string]::IsNullOrWhiteSpace($dbUrl)) {
        Write-Host "`nExiting. Please set DATABASE_URL and run again." -ForegroundColor Red
        exit 1
    }
    
    $env:DATABASE_URL = $dbUrl
    Write-Host "DATABASE_URL set." -ForegroundColor Green
    Write-Host ""
}

# Set NODE_ENV
$env:NODE_ENV = "development"

Write-Host "Step 1: Pushing database schema..." -ForegroundColor Cyan
try {
    npm run db:push
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Schema push failed. Check your DATABASE_URL." -ForegroundColor Red
        exit 1
    }
    Write-Host "Schema pushed successfully!" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "Error pushing schema: $_" -ForegroundColor Red
    exit 1
}

Write-Host "Step 2: Starting development server..." -ForegroundColor Cyan
Write-Host "Server will be available at http://localhost:5000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Run the dev server
npm run dev

