import { defineConfig } from "drizzle-kit";

// Minimal declaration so TypeScript is happy using process.env here,
// without depending on global Node type definitions in the editor.
declare const process: { env: { DATABASE_URL?: string } };

if (!process.env.DATABASE_URL) {
  throw new Error("DATABASE_URL, ensure the database is provisioned");
}

export default defineConfig({
  out: "./migrations",
  schema: "./shared/schema.ts",
  dialect: "postgresql",
  dbCredentials: {
    url: process.env.DATABASE_URL,
  },
});
