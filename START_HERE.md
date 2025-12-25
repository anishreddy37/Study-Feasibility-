# Quick Start Guide

## Step 1: Set Up Database (Choose One)

### Option A: Free Cloud PostgreSQL (Fastest - 2 minutes)

1. Go to **https://neon.tech** (or supabase.com)
2. Sign up (free, no credit card)
3. Create a new project
4. Copy the connection string from the dashboard
   - It looks like: `postgresql://user:password@host.neon.tech/dbname`

### Option B: Local PostgreSQL

1. Install PostgreSQL from https://www.postgresql.org/download/windows/
2. Create database: `createdb studyfeasibility`
3. Connection string: `postgresql://postgres:YOUR_PASSWORD@localhost:5432/studyfeasibility`

## Step 2: Run the Project

Open PowerShell in this directory and run:

```powershell
# Set your database URL
$env:DATABASE_URL = "your-connection-string-here"

# Push database schema
npm run db:push

# Start the server
npm run dev
```

The app will be available at: **http://localhost:5000**

## Testing Social Features

1. Open the app in your browser
2. Create an exam plan
3. Use the social features in the sidebar:
   - Add friends (use user IDs like 1, 2, 3)
   - Create cohorts
   - Start study sessions
   - Send messages (muted during sessions)

## Note on User IDs

The app uses `x-user-id` header for authentication (simple demo setup).
- Default user ID is 1
- To test with multiple users, use browser dev tools to set the header
- Or use different browsers/incognito windows

