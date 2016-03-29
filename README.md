### Зависимости

* [ansible](http://docs.ansible.com/ansible/intro_installation.html)
* git

### Установка
```
git clone <this repo>
make install-ansible # Если ansible еще не установлен
```

### Общее ПО (VirtualBox, Vagrant, etc)
```
make install-common-software
```

### Установка пакетов для разработки
```
make install-development # Можно задавать теги. См. `development.yml`
```

### dotfiles
```
make install-dotfiles
```
