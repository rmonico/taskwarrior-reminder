# Taskwarrior reminder script

A simple script to popup notifications (via `notify-send` command or another specified on configs) for taskwarrior tasks with **reminder** UDA attribute set.

`installer.sh` script will create service and link it with the timer on right folder.

Configuration file at `${XDG_CONFIG_HOME:-$HOME/.config}/reminders/config.yaml`.
If not found the default below is created:

```
# Its either on PATH ou specify full path to the command
notify_command: notify-send

# Time between checks in taskwarrior format
time_between_checks: 1min

# UTC offset, directly applied to reminder attribute when read from exported data
utc_offset: -3
```
