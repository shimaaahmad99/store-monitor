# StoreGuard

"Know what's wrong with your store before your customers do."

## Overview

StoreGuard is a SaaS platform that monitors e-commerce stores daily, detects technical, SEO, product, and availability issues, gives the store owner a health score, and provides actionable recommendations.

## Features

- Automated daily store monitoring
- Health score (0-100) with detailed breakdown
- Issue detection: broken links, missing meta, SEO problems, performance
- Smart recommendations (AI-powered when configured, deterministic fallback)
- Historical scan tracking with trend charts
- Daily reports with prioritized issues
- Multi-store support
- Responsive dashboard (mobile, tablet, desktop)
- Dark modern UI

## Tech Stack

- **Frontend**: React 18, TypeScript, Vite
- **Styling**: Tailwind CSS 4, Radix UI, Lucide Icons
- **Charts**: Recharts
- **Routing**: React Router v6
- **Backend/DB**: Supabase (PostgreSQL, Auth, RLS)
- **Deployment**: Cloudflare Pages

## Getting Started

### Prerequisites

- Node.js 18+
- A Supabase project (free tier works)

### 1. Clone and Install

```bash
git clone https://github.com/your-username/storeguard.git
cd storeguard
npm install
```

### 2. Environment Variables

Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

Fill in your Supabase credentials:

```
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key
```

### 3. Supabase Setup

1. Create a project at [supabase.com](https://supabase.com)
2. Go to SQL Editor and run the contents of `supabase/schema.sql`
3. This creates all tables, RLS policies, indexes, and triggers
4. Copy your project URL and anon key to `.env`

### 4. Run Development Server

```bash
npm run dev
```

The app runs in **demo mode** when Supabase is not configured, showing realistic sample data.

## Deployment (Cloudflare Pages)

### 1. Build

```bash
npm run build
```

### 2. Deploy to Cloudflare Pages

```bash
# Using Wrangler CLI
npx wrangler pages deploy dist --project-name=storeguard
```

Or connect your GitHub repo to Cloudflare Pages:

- Build command: `npm run build`
- Build output: `dist`
- Set environment variables in Cloudflare dashboard

### 3. Environment Variables

In Cloudflare Pages dashboard, add:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

## Project Structure

```
src/
├── components/       # UI and layout components
│   ├── ui/            # Reusable UI primitives (Button, Card, etc.)
│   ├── layout/        # App layout (Sidebar, TopBar, etc.)
│   ├── landing/       # Landing page sections
│   └── dashboard/     # Dashboard-specific components
├── pages/            # Route pages
│   ├── auth/          # Login, Signup, etc.
│   └── dashboard/     # Dashboard pages
├── layouts/          # Page layouts
├── hooks/            # Custom React hooks
├── services/         # External service abstractions
├── lib/              # Utilities and helpers
├── types/            # TypeScript type definitions
├── config/           # App configuration
├── data/             # Demo data
└── context/          # React contexts
```

## Architecture Notes

### Demo Mode

When Supabase is not configured, the app runs in demo mode with realistic sample data. This is clearly labeled "Demo Data" in the UI.

### Scanner Architecture

The scanner service (`src/services/scanner.ts`) provides a clean abstraction for website scanning. In the MVP, it uses a demo implementation. For production:

- Deploy scanner logic to Supabase Edge Functions
- The browser sends the URL to the edge function
- The edge function performs the actual crawl and returns results
- See `src/services/scanner.ts` for the interface

### AI Analysis

The AI service (`src/services/ai.ts`) falls back to deterministic rule-based analysis when no AI API key is configured. To enable AI:

- Set `VITE_AI_API_KEY` and `VITE_AI_API_URL`
- For production, move AI calls to a server-side function

### Payment System

The payment system (`src/services/payment.ts`) is designed as a clean abstraction. The MVP uses manual verification. To integrate a real provider:

- Implement the `IPaymentService` interface
- Configure environment variables

### Security

- All secrets in environment variables (never in frontend code)
- Supabase Row Level Security (RLS) on all tables
- Users can only access their own data
- SSRF protection in scanner (blocks private IPs, localhost)
- URL validation (HTTPS only)
- Input validation throughout

## License

MIT
