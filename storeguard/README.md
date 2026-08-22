# StorageGuard - Store Health Monitoring System

StorageGuard is a comprehensive React-based web application for monitoring and managing the health and performance of retail stores. It provides real-time dashboards, analytics, and alerts for store operations.

## Features

- 📊 **Real-time Dashboards** - Monitor store health metrics in real-time
- 🎯 **Health Scoring** - Automated health scoring based on multiple factors
- 🔔 **Smart Notifications** - Intelligent alert system for critical issues
- 📈 **Analytics & Reports** - Comprehensive reporting and trend analysis
- 👥 **Multi-user Support** - Role-based access control (Admin, Manager, Staff)
- 🔐 **Secure Authentication** - Supabase authentication integration
- 📱 **Responsive Design** - Works seamlessly on desktop and mobile

## Tech Stack

- **Frontend**: React 18 + TypeScript
- **Styling**: Tailwind CSS
- **UI Components**: Radix UI
- **State Management**: React Context API
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **Build Tool**: Vite
- **Form Handling**: React Hook Form + Zod
- **API Client**: Axios

## Getting Started

### Prerequisites
- Node.js 18+
- npm or yarn
- Supabase account

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd storeguard
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env.local` file:
```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
VITE_API_URL=http://localhost:3000
```

4. Start the development server:
```bash
npm run dev
```

### Building for Production

```bash
npm run build
npm run preview
```

## Project Structure

```
src/
├── components/       # React components
│   ├── dashboard/   # Dashboard-specific components
│   ├── landing/     # Landing page components
│   ├── layout/      # Layout components
│   └── ui/          # Reusable UI components
├── context/         # React Context providers
├── hooks/           # Custom React hooks
├── lib/             # Utility functions
├── pages/           # Page components
├── services/        # API and Supabase services
├── types/           # TypeScript type definitions
├── config/          # Configuration files
└── data/            # Mock/demo data
```

## Key Services

### Supabase Service
Handles all database operations and authentication:
```typescript
import { supabase } from '@/services/supabase'
```

### AI Service
Integrates with AI models for insights and recommendations:
```typescript
import { analyzeStoreData } from '@/services/ai'
```

### Payment Service
Manages subscription and payment processing:
```typescript
import { initializePayment } from '@/services/payment'
```

## Authentication

The app uses Supabase authentication with the following roles:
- **Admin**: Full access to all stores and features
- **Manager**: Access to assigned stores
- **Staff**: Limited access to their store

## Development

### Linting
```bash
npm run lint
```

### Type Checking
```bash
npx tsc --noEmit
```

## Deployment

The application can be deployed to various platforms:
- Vercel
- Netlify
- GitHub Pages
- Traditional web servers

## Contributing

Contributions are welcome! Please follow these guidelines:
1. Create a feature branch
2. Make your changes
3. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

For support and questions, please open an issue in the repository.
