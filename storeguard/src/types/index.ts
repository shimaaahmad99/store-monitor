export interface Store {
  id: string
  name: string
  location: string
  status: 'healthy' | 'warning' | 'critical'
  health_score: number
  last_check: string
  staff_count: number
  customer_satisfaction: number
  inventory_level: number
}

export interface HealthMetric {
  id: string
  store_id: string
  metric_name: string
  value: number
  threshold: number
  timestamp: string
  status: 'healthy' | 'warning' | 'critical'
}

export interface Notification {
  id: string
  store_id: string
  type: 'alert' | 'info' | 'warning'
  title: string
  message: string
  created_at: string
  read: boolean
}

export interface User {
  id: string
  email: string
  name: string
  role: 'admin' | 'manager' | 'staff'
  created_at: string
}

export interface Report {
  id: string
  store_id: string
  type: 'daily' | 'weekly' | 'monthly'
  data: Record<string, any>
  created_at: string
}
