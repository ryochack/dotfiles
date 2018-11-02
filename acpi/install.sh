#!/usr/bin/env sh

set -eu

yay -S acpid light-git alsa-utils
systemctl enable acpid
sudo chown root:root handlers/* events/* handler.sh
sudo chmod a+x handlers/* handler.sh
cp -ir events handlers handler.sh /etc/acpi/
systemctl start acpid
