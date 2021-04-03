# Fidgeting Bits Talon Repo README
This repo is meant to be used on Linux and is only tested on Arch.
It requires many non-standard python libraries in the talon virtual environment.

This is also developed around beta version of Talon so may result in errors related to functionality.

## Dependencies
notify-send.sh
In order to use dunst for notifications, this repo monkey patches talon notifications to call notify-send.sh instead of qt notifications
