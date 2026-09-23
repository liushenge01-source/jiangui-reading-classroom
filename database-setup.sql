-- Run this in the Supabase SQL Editor for the classroom project.
create table if not exists public.classroom_submissions (
  id bigint generated always as identity primary key,
  student_name text not null default '匿名同学' check (char_length(student_name) <= 24),
  prediction text not null check (char_length(prediction) <= 1000),
  evidence text not null check (char_length(evidence) <= 1000),
  story text not null check (char_length(story) <= 3000),
  created_at timestamptz not null default now()
);

alter table public.classroom_submissions enable row level security;
revoke all on public.classroom_submissions from anon, authenticated;
grant insert, select on public.classroom_submissions to anon;

drop policy if exists "Students can submit work" on public.classroom_submissions;
create policy "Students can submit work"
  on public.classroom_submissions for insert to anon
  with check (true);

drop policy if exists "Anyone can read classroom work" on public.classroom_submissions;
create policy "Anyone can read classroom work"
  on public.classroom_submissions for select to anon
  using (true);
