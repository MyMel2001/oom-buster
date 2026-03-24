#!/bin/bash
sudo sysctl vm.swappiness=10
sudo apt install earlyoom
sudo systemctl enable --now earlyoom
sudo apt install zram-config
