# dotfiles

File structure of directory follows location of where the files should be in relation to `$HOME`.

[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) can be used to auto-link files to where they belong. Simply run `stow --dotfiles --no-folding .`. If there are existing files causing conflicts, `stow --adopt .` and pull from the repository to ensure any overwrites don't stick. The `--dotfiles` flag allows for `.<something>` files to be named `dot-<something>` within the repository, thus avoiding hidden files, and the `--no-folding` flag makes it so only directory contents are symlinked, and not directories themselves.

[This video](https://www.youtube.com/watch?v=y6XCebnB9gs) provides a great simple explanation on `stow`.
