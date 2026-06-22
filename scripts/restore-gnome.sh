#!/bin/bash
echo "Restoring GNOME Desktop settings..."
dconf load / < configs/desktop/dconf.ini
echo "GNOME settings restored successfully!"
