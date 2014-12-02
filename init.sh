#!/bin/bash

readonly LOGGER=color-logger.bash

echo "Installing..."

if [[ ! -e $LOGGER ]]; then
  echo "Installing color logger"

  wget "https://raw.githubusercontent.com/swyckoff/color-logger-bash/master/$LOGGER"
  chmod 0755 $LOGGER
fi

