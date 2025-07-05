#!/usr/bin/env bash

sudo apt install -y dash
sudo dpkg-reconfigure dash
ls -l /bin/sh
chsh -s /bin/dash
