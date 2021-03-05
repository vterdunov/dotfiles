#!/usr/bin/env bash

set -e
set -o pipefail

msg() {
  echo "-- $*"
}

err() {
  echo " [X] $*" >&2
  exit 1
}


DOTENV_INSTALL_DIR="$HOME/.dotenv-install"

setup_ansible() {
  msg 'Setup ansible.'
  cd "$DOTENV_INSTALL_DIR"

  python3 -m venv venv

  # shellcheck source=/dev/null
  source venv/bin/activate

  pip install \
    --disable-pip-version-check \
    --quiet \
    --requirement requirements.txt
}

setup_oh_my_zsh() {
  if ! [[ -d ~/.zsh ]]; then
    msg 'Install Oh My ZSH.'
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

setup_fzf() {
  if ! [[ -d ~/.fzf ]]; then
    msg 'Install fzf.'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  fi
}

update_fzf() {
  msg 'Update fzf.'
  ~/.fzf/install --no-bash --no-fish --bin
}

run_ansible() {
  msg 'Run ansible-playbook.'
  ansible-playbook dotfiles.yml -e ansible_become_password="$SUDO_PASS" --inventory '127.0.0.1,'
}

check() {
  if [[ -z $SUDO_PASS ]]; then
    err 'Please "export SUDO_PASS=your-sudo-password" environment variabe.'
  fi
}

main() {
  check
  setup_oh_my_zsh
  setup_fzf
  update_fzf

  setup_ansible
  run_ansible

}

main "$@"
