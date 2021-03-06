# dotfiles

![prompt](/static/prompt.png?raw=true)

## Install
```bash
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles && \
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Checkout the actual content from the git repository to your `$HOME`
```bash
dotfiles checkout
```

```bash
export SUDO_PASS=your-sudo-pass
bash install.sh
```

## Manage
```bash
git init --bare $HOME/.dotfiles
```

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

Usage:
```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```
