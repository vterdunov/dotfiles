### Зависимости

* [ansible](http://docs.ansible.com/ansible/intro_installation.html)
* git

### Установка
```
git clone <this repo>
make install_ansible # Если ansible еще не установлен
```

### Общее ПО (VirtualBox, Vagrant, etc)
```
make install_common-software
```

### Установка пакетов для разработки
```
make install_development # Можно задавать теги. См. `development.yml`
```

### dotfiles
```
make install_dotfiles
```
