# Dixon's Planner

A personal planner for school, a club, personal projects, and to-dos. It started as a claude.ai artifact and is now its own website.

## Who you're working with
Dixon is a student at Syracuse University, and **this is Dixon's first coding project and first time using Claude Code and the Terminal.**
- Explain each step in plain language before doing it: what it does and why. Keep explanations short.
- When Dixon has to do something outside the terminal (create an account, click a button on a website, paste a key), give numbered steps and wait for confirmation.
- Prefer the simplest tool that works. No frameworks, build steps, or npm packages unless they clearly earn their place.
- After each working change, offer to commit it to git with a clear message.
- Never put secret keys in the code. The Supabase **anon/publishable** key is fine to ship in the front end. The **service_role/secret** key is never committed.

## What's here
- `index.html`: the whole app (HTML + CSS + vanilla JS in one file). Use it at https://dscherer6.github.io/dixons-planner/ or locally at http://localhost:8000 (double-clicking can't sign in).
- `data/seed.js`: Dixon's real Fall 2026 coursework (5 courses, 43 items), exported from the claude.ai version. Gitignored (stays on Dixon's Mac). Already imported into Dixon's Supabase account; the app offers it as a one-time Import only when the signed-in account is empty.
- `supabase/schema.sql`: the planned database tables, with row-level security so each user only sees their own data.
- `START-HERE.md`: Dixon's step-by-step guide.

## Data model
- **courses** keyed by id (`fin345`, `psy322`, `psy335`, `wrt307`, `fin452`): `code, name, days, time, room, note, order, sessions[]`. Each session is `{d:"YYYY-MM-DD", t:topic, r:reading, off:bool}` and `off` means no class.
- **items** keyed by id: `course, title, kind (exam|project|hw|quiz|reading|task), date ("YYYY-MM-DD" or null for TBD), time ("HH:MM" or ""), detail, done`.
- Storage is Supabase (project `xxduaykitaegdbqwzvgf`) through a small `SupaDB` shim in `index.html` with the claude.ai-style API `doc("items/id").set/update/delete`. `toRow`/`fromRow` translate app camelCase (`doneAt`, `createdAt`) to table snake_case columns; add new fields to `COLS` there and to `supabase/schema.sql`.
- Sign-in is an email magic link. Supabase's free email can't edit templates (needs custom SMTP), so there's no 6-digit code. Links can't return to a double-clicked `file://` page; for local testing run `python3 -m http.server 8000` and open http://localhost:8000 (already in Supabase's Redirect URLs).

## Roadmap (do these in order, one at a time)
1. **Local + git:** run it locally, `git init`, make the first commit, and create a GitHub repo (use `gh` if it's installed; otherwise guide Dixon through the website).
2. **Online:** publish with GitHub Pages so it has a real URL that works on a phone.
3. **Real database + login:** create a Supabase project. Run `supabase/schema.sql`, add email magic-link sign-in, replace `LocalDB` with the Supabase JS client (load it from a CDN `<script>` tag), and import `data/seed.js` into Dixon's account once.
4. **Phone app feel:** add a web app manifest and an icon so "Add to Home Screen" works.
5. **Beyond school:** add an `area` field (school / club / personal / life) to items. Then add recurring club meetings (weekly or twice weekly), a Projects & Goals view with progress, and daily/weekly/monthly recurring to-dos.
6. **Sharing:** friends and family sign in and get their own empty planner. Row-level security already keeps everyone's data separate. Add an "import a syllabus" helper later.

## Open data questions (ask Dixon when relevant)
- Class meeting times and rooms for each course (these can be edited in the app's Courses tab)
- FIN 345 final exam date and the IPO project due date
- PSY 335 section (M001 11:00 or M003 9:30)
- WRT 307 Module 3 calendar (Module 2 ends Oct 29)
