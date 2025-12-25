# Setup Guide for Study-Feasibility

## Prerequisites

This application requires a PostgreSQL database to run.

## Quick Setup Options

### Option 1: Free Cloud PostgreSQL (Recommended for Quick Start)

1. **Supabase** (Easiest):
   - Go to https://supabase.com
   - Sign up for free
   - Create a new project
   - Go to Settings > Database
   - Copy the connection string (URI format)
   - It will look like: `postgresql://postgres:[YOUR-PASSWORD]@db.[PROJECT-REF].supabase.co:5432/postgres`

2. **Neon**:
   - Go to https://neon.tech
   - Sign up for free
   - Create a new project
   - Copy the connection string from the dashboard

3. **ElephantSQL**:
   - Go to https://www.elephantsql.com
   - Sign up for free
   - Create a new instance
   - Copy the connection string

### Option 2: Local PostgreSQL

1. Download PostgreSQL from https://www.postgresql.org/download/windows/
2. Install it (remember the password you set for the `postgres` user)
3. Create a database: `createdb studyfeasibility`
4. Your connection string will be: `postgresql://postgres:YOUR_PASSWORD@localhost:5432/studyfeasibility`

## Running the Application

Once you have your DATABASE_URL:

### Windows PowerShell:
```powershell
cd "C:\Users\bk246\Downloads\Study-Feasibility (2)\Study-Feasibility"
$env:DATABASE_URL="your-connection-string-here"
$env:NODE_ENV="development"
npm run dev
```

### Or use the run script:
```powershell
.\run.ps1
```
(You'll be prompted to enter your DATABASE_URL)

## Database Schema Setup

After setting up the database, you need to push the schema:

```powershell
$env:DATABASE_URL="your-connection-string-here"
npm run db:push
```

## Access the Application

Once running, the application will be available at:
- http://localhost:5000

