#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if test $(which brew); then
    # Run bryggeri
    /bin/bash -c "$(curl -fsSL https://brg.re/install)"
fi

if test $(which bryggeri); then
    # Install brew packages
    bryggeri install
    bryggeri install --cask
fi
