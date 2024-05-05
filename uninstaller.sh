#!/usr/bin/bash

repo_dir="$(realpath "$(dirname "$0")")"
systemd_user_dir="$HOME/.config/systemd/user"

echo "Removing symlinks for systemd user services..."
rm -v "$systemd_user_dir/taskwarrior-reminders.service" "$systemd_user_dir/taskwarrior-reminders.timer"

echo "Disabling systemd user services..."
systemctl --user daemon-reload

