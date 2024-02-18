# KernelSU Builder

KernelSU Builder is a tool that allows you to build kernels with KernelSU support or without it. It uses GitHub Actions for automated kernel builds and supports multiple versions and configurations.

[![Kernel Builder](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/build_kernel.yml/badge.svg)](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/build_kernel.yml)
[![Watch KernelSU](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/watch_ksu.yml/badge.svg)](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/watch_ksu.yml)

## Table of Contents
- [Getting Started](#getting-started)
- [Adding a Device](#adding-a-device)
- [Flashing the Kernel](#flashing-the-kernel)

## Getting Started

Follow these steps to use this Builder:

1. Fork this repository.
2. Update the `sources.yaml` file with your build requirements.
3. Set up the necessary secrets in your repository settings. The required secret is `GH_PAT`: A personal access token with the `repo` scope.
4. Wait for the build to finish.

## Adding a Device

1. Edit anykernel.sh and change the `DEVICE` variable to your device codename.

## Flashing the Kernel

To flash the kernel onto your device:

1. Download the kernel release from GitHub.
2. Use your preferred recovery to flash the kernel.
3. If you want root access, flash KernelSU version.
4. Reboot your device.
