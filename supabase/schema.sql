-- 1:1 Notebook: one table of JSON documents, each row owned by the signed-in user.
create table if not exists public.docs (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  id         text        not null,
  kind       text        not null check (kind in ('people','meetings')),
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.docs enable row level security;

drop policy if exists "Owner reads and writes own docs" on public.docs;
create policy "Owner reads and writes own docs" on public.docs
  for all to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

revoke all on public.docs from anon;

-- Keep-awake ping used by .github/workflows/keep-awake.yml.
-- Returns only the current time; it reads no notes.
create or replace function public.keep_awake() returns timestamptz
language sql stable security invoker set search_path = '' as $$ select now() $$;
grant execute on function public.keep_awake() to anon;
