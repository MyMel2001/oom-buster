# OOM Buster (CC0)
***I ain't afraid of no ghost processes.***

This script is a "set it and forget it" solution for Ubuntu Servers running memory-intensive applications like Ollama, Docker, or large databases. It prevents the common "system freeze" that happens when RAM usage hits 100%.

## What this script does:

1. Optimizes Swappiness:
By default, Linux starts moving data to the slow hard drive (Swap) too early. This script sets vm.swappiness to 10, forcing the system to prioritize fast RAM and only use the disk as a last resort. This keeps your SSH session and apps responsive.

2. Installs and Enables EarlyOOM:
The standard Linux kernel often waits too long to kill a memory-hogging process, leading to a "frozen" server. EarlyOOM is a proactive background service that detects when RAM is dangerously low and kills the biggest offender (the "hog") before the entire OS hangs.

3. Configures ZRAM:
ZRAM creates a compressed swap partition directly inside your RAM. It effectively "stretches" your existing memory by compressing inactive data. For LLM users, this can provide an extra 1-2GB of breathing room without the speed penalty of a physical disk.

## How to use:

1. Save the script as bust-oom.sh
2. Run chmod +x bust-oom.sh
3. Execute with sudo ./bust-oom.sh

## License:

This work is marked with CC0 1.0. To the extent possible under law, the author has waived all copyright and related or neighboring rights to this software. You are free to copy, modify, and distribute this script even for commercial purposes, all without asking permission.
