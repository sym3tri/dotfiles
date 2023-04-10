ABOUT
-----
All my dotfiles for my shell, git, vim etc.


INSTALL
-------

- `git clone` this repo
- install deps listed in setup.sh script
- run the new-setup.sh script


TODO:
 move git aliases to git config

UNINSTALL (MAC)
---------------

Remove all homebrew formulas:

```bash
brew list -1 | xargs brew uninstall --force
```

Remove homebrew itself:
https://github.com/Homebrew/brew/blob/master/docs/FAQ.md#how-do-i-uninstall-homebrew

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```

