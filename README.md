# dotfiles

- `dotfiles/foo/<stuff-relative-to-home>` => e.g., for nvim: `dotfiles/nvim/.config/nvim/...`
- `stow foo` => try it out and check symlinked dir in home
- `stow -D foo` => unlink it again
- You can have versioned subdirectories (e.g., version `dotfiles/nvim/.config/nvim`)
    - It does not matter whether you manipulate `dotfiles/foo/bar` or the symlinked `~/foo`...
    - If the dir is already versioned when adding to dotfiles => `mv .git git` then commit to dotfiles and then `mv git .git` (commit again) or add as submodule or whatever...
- Keep individual `.gitignore` (e.g., `dotfiles/nvim/.config/nvim/.gitignore`) to exclude certain files and folders
