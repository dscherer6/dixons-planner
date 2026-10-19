-- Dixon's Planner: Supabase schema (phase 3).
-- Paste this into Supabase → SQL Editor → New query → Run.
-- Every row belongs to the signed-in user; row-level security keeps each person's planner private.

create table if not exists public.courses (
  user_id   uuid not null default auth.uid() references auth.users(id) on delete cascade,
  id        text not null,               -- e.g. 'fin345'
  code      text not null,               -- 'FIN 345'
  name      text not null,
  days      text default '',
  time      text default '',
  room      text default '',
  note      text default '',
  "order"   int  default 0,
  sessions  jsonb not null default '[]', -- [{d:'2026-10-19', t:'Debt and Taxes', r:'Ch 15', off:false}]
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

create table if not exists public.items (
  user_id   uuid not null default auth.uid() references auth.users(id) on delete cascade,
  id        text not null,
  course    text default '',
  area      text not null default 'school', -- school | club | personal | life (phase 5)
  title     text not null,
  kind      text not null default 'task',   -- exam | project | hw | quiz | reading | task
  date      date,                           -- null = date TBD
  time      text default '',                -- 'HH:MM'
  detail    text default '',
  done      boolean not null default false,
  source    text default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.courses enable row level security;
alter table public.items   enable row level security;

create policy "own courses" on public.courses
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own items" on public.items
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
