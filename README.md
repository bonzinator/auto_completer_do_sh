### Настраиваем автодополнение скрипта `do.sh`

1. Сохраняем скрипт куда вам больше нравится, не принципиально
2. В самом конце скрипта указываем полный и относительные пути к скрипту `do.sh`
Например:
```bash
complete -F _do_sh_completion /srv/drx/do.sh
complete -F _do_sh_completion ./do.sh
```
3. Добавьте строку в ваш файл .bashrc или .bash_profile, чтобы подключить автодополнение:
```bash
source /путь/до/do.sh-completion.sh
```
4. Перезапустите оболочку bash или выполните:
```bash
source ~/.bashrc
```
или
```bash
source ~/.bash_profile
```

Теперь при вводе команды ./do.sh и нажатии клавиши Tab должно 
работать автодополнение для параметров all dt platform 
components db rxcmd ct certificatetool, а также для их 
значений.

