# AGENTS.md

Guidance for agents working in this Neovim config repository.

## Scope
- This repo is a personal fork/customization of `kickstart.nvim`.
- Keep changes minimal, readable, and easy to maintain.
- Prefer extending existing modules over introducing new top-level structure.

## Repo layout
- `init.lua`: entrypoint, loads `lua/config/*`.
- `lua/config/*.lua`: core config (options, keymaps, autocmds, lazy bootstrap).
- `lua/kickstart/plugins/*.lua`: upstream-style plugin specs and config.
- `lua/custom/plugins/*.lua`: local custom plugin specs and overrides.
- `doc/kickstart.txt`: help documentation.
- `lazy-lock.json`: plugin lockfile managed by `lazy.nvim`.

## Editing rules
- Use idiomatic Lua and follow existing style in nearby files.
- Keep plugin specs declarative (`opts`, `keys`, `cmd`, `event`) unless imperative config is required.
- Preserve startup behavior and lazy-loading semantics when changing plugin config.
- Avoid unrelated cleanup in the same change.

## Formatting
- Format Lua with Stylua using repo config in `.stylua.toml`.
- Current style includes:
  - 2-space indentation
  - Unix line endings
  - prefer single quotes where possible
  - up to 160 columns

## Validation
- For Lua changes, run:
  - `stylua .`
- For config/load regressions, run headless Neovim checks:
  - `nvim --headless "+qa"`
- If plugin specs changed, ensure lockfile and startup still work:
  - `nvim --headless "+Lazy! sync" "+qa"`

## Change hygiene
- Mention touched files and behavior impact in summaries.
- Flag any assumption about local tools (`stylua`, `nvim`, `make`) if not verified.
