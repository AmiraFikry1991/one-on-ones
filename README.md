# 1:1 Notebook

A private, agenda-led notebook for weekly 1:1s: agenda items with their outcomes (Agreed, Note, Action), open action items that roll forward, a dated history, and search across every 1:1.

Hosted on GitHub Pages. Notes are stored in Supabase and only load after signing in; row level security means each account can read and write only its own rows. No notes are stored in this repository.

## Setup

1. Create a Supabase project and run `supabase/schema.sql` in the SQL Editor.
2. In Authentication, add your user and turn off new sign-ups.
3. Put the project URL and anon key in `config.js`.
4. Enable GitHub Pages (Settings > Pages > Deploy from branch > `main` / root).
