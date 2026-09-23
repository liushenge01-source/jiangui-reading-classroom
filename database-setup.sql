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


-- Teacher-initiated cleanup. This database stores only a SHA-256 digest of the
-- classroom clear code; the code itself must never be committed to this file.
create extension if not exists pgcrypto with schema extensions;

create or replace function public.clear_classroom_submissions(clear_key text)
returns integer
language plpgsql
security definer
set search_path = public, extensions
as $$
declare removed integer;
begin
  if clear_key is null or encode(extensions.digest(convert_to(clear_key, 'UTF8'), 'sha256'), 'hex') <> 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3' then
    raise exception 'Invalid classroom clear key' using errcode = '42501';
  end if;
  delete from public.classroom_submissions where true;
  get diagnostics removed = row_count;
  return removed;
end;
$$;

revoke all on function public.clear_classroom_submissions(text) from public;
grant execute on function public.clear_classroom_submissions(text) to anon;
