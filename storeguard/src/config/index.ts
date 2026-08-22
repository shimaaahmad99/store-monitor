export const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000'

export const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL || ''
export const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY || ''

export const HEALTH_SCORE_THRESHOLDS = {
  CRITICAL: 30,
  WARNING: 70,
  HEALTHY: 100,
}

export const CHART_COLORS = {
  primary: '#0ea5e9',
  success: '#10b981',
  warning: '#f59e0b',
  danger: '#ef4444',
  info: '#3b82f6',
}
