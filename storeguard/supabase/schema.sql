-- Enable required extensions
create extension if not exists "uuid-ossp";
create extension if not exists "pg_trgm";

-- Users table
create table if not exists users (
  id uuid primary key default uuid_generate_v4(),
  email text unique not null,
  name text not null,
  role text check (role in ('admin', 'manager', 'staff')) default 'staff',
  created_at timestamp default now(),
  updated_at timestamp default now()
);

-- Stores table
create table if not exists stores (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  location text not null,
  status text check (status in ('healthy', 'warning', 'critical')) default 'healthy',
  health_score int default 100 check (health_score >= 0 and health_score <= 100),
  last_check timestamp default now(),
  staff_count int default 0,
  customer_satisfaction float default 0,
  inventory_level int default 0,
  created_at timestamp default now(),
  updated_at timestamp default now()
);

-- Health metrics table
create table if not exists health_metrics (
  id uuid primary key default uuid_generate_v4(),
  store_id uuid not null references stores(id) on delete cascade,
  metric_name text not null,
  value float not null,
  threshold float not null,
  status text check (status in ('healthy', 'warning', 'critical')),
  timestamp timestamp default now(),
  created_at timestamp default now()
);

-- Notifications table
create table if not exists notifications (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references users(id) on delete cascade,
  store_id uuid references stores(id) on delete cascade,
  type text check (type in ('alert', 'info', 'warning')) default 'info',
  title text not null,
  message text not null,
  read boolean default false,
  created_at timestamp default now(),
  updated_at timestamp default now()
);

-- Reports table
create table if not exists reports (
  id uuid primary key default uuid_generate_v4(),
  store_id uuid not null references stores(id) on delete cascade,
  type text check (type in ('daily', 'weekly', 'monthly')) default 'daily',
  data jsonb default '{}',
  created_at timestamp default now(),
  updated_at timestamp default now()
);

-- Indexes for performance
create index if not exists idx_stores_status on stores(status);
create index if not exists idx_health_metrics_store_id on health_metrics(store_id);
create index if not exists idx_health_metrics_timestamp on health_metrics(timestamp);
create index if not exists idx_notifications_user_id on notifications(user_id);
create index if not exists idx_notifications_read on notifications(read);
create index if not exists idx_reports_store_id on reports(store_id);
create index if not exists idx_reports_type on reports(type);
