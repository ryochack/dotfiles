#!/bin/sh
acpi -b | grep -v "rate information unavailable" | grep -oE [0-9]\+%
