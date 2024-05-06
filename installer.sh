#!/usr/bin/bash

repo_dir="$(realpath "$(dirname "$0")")"
systemd_user_dir="$HOME/.config/systemd/user"

sed 's/__repository_folder__/'"${repo_dir//\//\\/}"'/g' "$repo_dir/taskwarrior-reminders.template.service" > "$repo_dir/taskwarrior-reminders.service"

echo "Creating symlinks for systemd user services..."
ln -s "$repo_dir/taskwarrior-reminders.service" "$systemd_user_dir/taskwarrior-reminders.service"
ln -s "$repo_dir/taskwarrior-reminders.timer" "$systemd_user_dir/taskwarrior-reminders.timer"

echo "Enabling systemd user services..."
systemctl --user daemon-reload

echo
echo
systemctl --user status taskwarrior-reminders.timer taskwarrior-reminders.service

systemctl --user start taskwarrior-reminders.timer
