#!/bin/sh
echo `acpi -b | grep -oE [0-9]\+%`
