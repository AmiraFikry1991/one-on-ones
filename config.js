// Supabase connection for the 1:1 Notebook.
// The anon key is designed to be public: your notes are protected by sign-in
// and row level security (see supabase/schema.sql), not by hiding this key.
window.ONE_ON_ONES_CONFIG = {
  supabaseUrl: "PASTE_YOUR_SUPABASE_PROJECT_URL",
  supabaseAnonKey: "PASTE_YOUR_SUPABASE_ANON_KEY"
};
