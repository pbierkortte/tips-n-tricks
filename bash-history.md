# How to manage command history in the terminal
Whether it's confidential client data or passwords, there are times when you may not want some commands saved in the history.

## Excluding a single command from history
To prevent a command from being recorded in the history, you can add a space before the command. For example, if you type a space at the beginning of the command, it will not be saved in the history file.

## Clear History
Remove recent commands from the session history, run the following:
```bash
history -c
```

## Disable History
If you want to turn off the command history temporarily, you can unset the HISTFILE variable using the command:
```bash
unset HISTFILE
```
