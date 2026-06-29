# RCC PM Dashboard

Construction Project Management dashboard (style: Structura) cho Mr Phán — PM của RCC.

## Stack
- Next.js 14 (App Router) + Tailwind + Recharts
- Supabase (Postgres + Storage drive-type + Auth + Realtime)
- dnd-kit (Kanban drag-drop)
- Zera bot: cron 6-week look-ahead → Telegram group

## Setup
1. **DB**: chạy `supabase-setup.sql` trong Supabase SQL Editor + tạo 3 buckets (documents, site-photos, reports)
2. **Deploy**: push lên GitHub → import vào Vercel
3. **Env (Vercel → Settings → Environment Variables)**:
   ```
   NEXT_PUBLIC_SUPABASE_URL=https://eyxqbpcgrunksmirsiia.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon key>
   ```
4. `npm install && npm run dev` (local) hoặc Vercel auto-build

## Features
- Dashboard: 5 KPI cards, S-curve, Project-by-Status chart, Recent Projects, 6-Week Look-ahead, Constraint banner
- Kanban: To Do / In Progress / Review / Done (drag-drop, persist Supabase)
- Demo data fallback khi chưa có Supabase key

## Cron (Zera)
- Daily Brief 08:00 VN
- 6-Week Look-ahead Thứ 2 08:30 VN
- Overdue Alert 17:00 VN
- Weekly Report Thứ 6 16:00 VN
→ gửi group Project Management X Zera
