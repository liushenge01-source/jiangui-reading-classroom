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
grant insert on public.classroom_submissions to anon;
grant select on public.classroom_submissions to authenticated;

drop policy if exists "Students can submit work" on public.classroom_submissions;
create policy "Students can submit work"
  on public.classroom_submissions for insert to anon
  with check (true);

drop policy if exists "Signed-in teacher can view work" on public.classroom_submissions;
create policy "Signed-in teacher can view work"
  on public.classroom_submissions for select to authenticated
  using (auth.uid() is not null);
