# dotfiles

## Install
```console
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles && \
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Checkout the actual content from the git repository to your `$HOME`
```console
dotfiles checkout
```

```console
export SUDO_PASS=your-sudo-pass
bash install.sh
```

## Manage
```console
git init --bare $HOME/.dotfiles
```

```console
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

Usage:
```console
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```
