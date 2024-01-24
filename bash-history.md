# How manage command history in the terminal
In a Linux terminal, the command history is a useful feature for storing previously executed commands. However, there are scenarios where you might want to control what is recorded in the command history when working with sensitive information.

## Excluding a single command from history
To prevent a command from being recorded in the history, you can add a space before the command. For example, if you type a space at the beginning of the command, it will not be saved in the history file.

## Clearing Command History
Clear the current session's history list from memory. This command effectively removes all the commands from the current session's history, so on exit they are not saved to the history file.
```bash
history -c
```

## Disabling Command History
Disabling the command history by unsetting the HISTFILE variable
```bash
unset HISTFILE
```
