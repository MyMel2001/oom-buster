#!/bin/bash
# Optimized for Ubuntu Server - CC0 License

# 1. Lower swappiness to keep the system responsive in RAM
# We apply it now AND make it permanent for reboots
sudo sysctl vm.swappiness=10
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf

# 2. Install EarlyOOM to kill memory hogs before the kernel hangs
sudo apt update && sudo apt install -y earlyoom
sudo systemctl enable --now earlyoom

# 3. Install ZRAM to effectively "expand" RAM via compression
# This is a lifesaver for LLMs and low-RAM VPS nodes
sudo apt install -y zram-config

echo "Optimization complete. Your server is now OOM-resistant!"
