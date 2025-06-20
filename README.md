# Dotefiles
Personal dotfiles

## How to stow
(for my own memory)

Run the following command
```shell
stow -R -v -t ~ <app name> --adopt
```

stow is the command

The `-R` flag is for restowing, essentially a refresh (I think).

The `-v` flag is verbose, because I like to see what is happening.

The `-t ~` flag and argument is the target directory for stowing. In this case `~` (tilda) which is alias for the home directory.

The `<app name>` argument is the app name of whatever you're stowing. Must match a folder in current dir. The folder structure within the the folder is what is being symlinked to the target folder.

The `--adopt` flag is for making errors go away when there a conflict of some sort. It actually moves your existing dotfiles from the target to the source (git repo). Just use this and run `git reset -hard` to undo the changes.
