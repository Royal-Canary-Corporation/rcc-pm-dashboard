-- RCC PM Dashboard — Supabase schema
-- Chạy trong Supabase Dashboard → SQL Editor → New query → Run

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  location text,
  status text default 'Not Started',
  progress_pct numeric default 0,
  budget numeric,
  spent numeric default 0,
  start_date date,
  target_end date,
  pm text,
  cover_url text,
  created_at timestamptz default now()
);

create table if not exists tasks (
  id uuid primary key default gen_random_uuid(),
  project_id uuid references projects(id) on delete cascade,
  title text not null,
  phase text,
  zone text,
  owner text,
  priority text default 'Medium',
  kanban_status text default 'To Do',
  planned_start date,
  planned_end date,
  actual_start date,
  actual_end date,
  progress_pct numeric default 0,
  due_date date,
  constraint_note text,
  notes text,
  created_at timestamptz default now()
);

create table if not exists milestones (
  id uuid primary key default gen_random_uuid(),
  project_id uuid references projects(id) on delete cascade,
  name text not null,
  due_date date,
  status text default 'Pending',
  type text,
  created_at timestamptz default now()
);

-- RLS: cho phép đọc public (anon), ghi qua auth (tùy chỉnh sau)
alter table projects enable row level security;
alter table tasks enable row level security;
alter table milestones enable row level security;

create policy "read all" on projects for select using (true);
create policy "read all" on tasks for select using (true);
create policy "read all" on milestones for select using (true);
create policy "write all" on projects for all using (true) with check (true);
create policy "write all" on tasks for all using (true) with check (true);
create policy "write all" on milestones for all using (true) with check (true);

-- Seed demo
insert into projects (name, location, status, progress_pct, budget, spent, start_date, target_end, pm)
values ('Le Meridien Fit-out', 'HCMC', 'In Progress', 35, 5000000000, 1750000000, '2026-06-01', '2026-12-31', 'Mr Phán');

-- Storage buckets: tạo trong Storage UI → documents, site-photos, reports
