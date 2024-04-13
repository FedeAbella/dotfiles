# dotfiles

File structure of directory follows location of where the files should be in relation to `$HOME`.

[GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) can be used to auto-link files to where they belong. Simply run `stow .`. If there are existing files causing conflicts, `stow --adopt .` and pull from the repository to ensure any overwrites don't stick.

[This video](https://www.youtube.com/watch?v=y6XCebnB9gs) provides a great simple explanation on `stow`.

**Note:** `stow` will directly link directories if those don't exist, which may
cause files to then be added to `.dotfiles` if a program creates them in the
directory (e.g.: any other configuration files are created under `.config/xxx`).
To avoid this, create any directories needed first, then run `stow .` to just
link the files
