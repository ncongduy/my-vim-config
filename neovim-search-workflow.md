# Searching and Opening Files in Neovim — Without Plugins

A plugin-free workflow for searching code and jumping to files in Neovim. Works on any machine you can SSH into, no configuration required.

## Overview

There are two practical approaches, depending on your style:

1. **Inside Neovim** — use `:grep` and the quickfix list
2. **Outside Neovim** — use two terminal panes, one for searching and one for editing

Both are battle-tested. Pick whichever fits your brain better.

---

## Approach 1: Search From Inside Neovim

Neovim has built-in search commands that work across files in your project.

### Configure `:grep` to use ripgrep (recommended)

By default `:grep` shells out to the system `grep`. If you have `ripgrep` installed, point it there for speed and `.gitignore` support:

```vim
:set grepprg=rg\ --vimgrep\ --smart-case
:set grepformat=%f:%l:%c:%m
```

Put these in your `init.lua` or `init.vim` once and forget them.

### Run a search

```vim
:grep "loginUser"
:grep "pattern" src/
```

This populates the **quickfix list** with every match.

### Navigate results

| Command | What it does |
|---|---|
| `:copen` | Open the quickfix window listing all matches |
| `:cclose` | Close the quickfix window |
| `:cnext` / `:cn` | Jump to the next match |
| `:cprev` / `:cp` | Jump to the previous match |
| `:cc 5` | Jump directly to match number 5 |

Inside the quickfix window, press `<Enter>` on any line to open that file at the exact line of the match.

### Finding files by name

If you know roughly what the filename looks like, use `:find`:

```vim
:set path+=**
:find UserService.ts
```

`:find` supports tab completion and recursive matching once `path+=**` is set.

### Searching within the current file

Plain old vim motions:

- `/pattern` — search forward
- `?pattern` — search backward
- `n` / `N` — next / previous match
- `*` — search for the word under the cursor

---

## Approach 2: Two Terminals (or Tmux Panes)

A classic workflow: one terminal for searching, one for editing. Simple, scales well, and works everywhere.

### Search in pane 1

Use `ripgrep` if available — it's faster and respects `.gitignore`:

```bash
rg -i "loginUser"
```

If you're stuck with `grep`:

```bash
grep -rin --exclude-dir={.git,node_modules} "loginUser" .
```

Output looks like:

```
src/auth/login.ts:42:export function loginUser(...)
```

### Open the file in pane 2 — jump straight to the line

Don't bother with `:e file` then jumping manually. Neovim accepts a `+N` argument:

```bash
nvim +42 src/auth/login.ts
```

Cursor lands on line 42 immediately. You can also jump to a pattern:

```bash
nvim +/loginUser src/auth/login.ts
```

### Use tmux to split your screen

If you're not already using tmux, this workflow gets much nicer with it:

```bash
tmux
```

Then:

- `Ctrl-b "` — split horizontally
- `Ctrl-b %` — split vertically
- `Ctrl-b o` — switch between panes

Now you've got `rg` in one pane and `nvim` in the other, side by side.

---

## A Complete Example

You're hunting for where `loginUser` is defined:

**Inside Neovim:**

```vim
:grep "function loginUser"
:copen
" press <Enter> on the match you want
```

**Two-pane workflow:**

```bash
# pane 1
rg -in "function loginUser"
# → src/auth/login.ts:42:export function loginUser(...)

# pane 2
nvim +42 src/auth/login.ts
```

Same result, different ergonomics.

---

## Tips and Gotchas

- **Don't open the same file in two Neovim instances** — you'll get a swap file warning. Edit in one, search in the other.
- **Edits sync through the filesystem.** Save in pane 2, re-run `rg` in pane 1, and you'll see the new content. No special syncing needed.
- **Map `:copen` to a leader key** if you toggle the quickfix list a lot:

  ```vim
  nnoremap <leader>q :copen<CR>
  ```

- **`rg` respects `.gitignore` by default.** If you actually want to search ignored files, add `--no-ignore`.
- **`grep -rin` flags** — `-r` recursive, `-i` case-insensitive, `-n` show line numbers. Memorize these three; they're the workhorses.

---

## When to Reach for Plugins

This setup covers maybe 90% of daily search-and-edit work. Plugins like Telescope or fzf-lua optimize the remaining 10% — fuzzy filename matching, live preview, interactive filtering. They're nice, but they're not necessary. The plugin-free workflow scales surprisingly far, and it works identically on every machine you touch.
