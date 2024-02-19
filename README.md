# KernelSU Builder

KernelSU Builder is a tool that allows you to build kernels with or without KernelSU support. It uses GitHub Actions for automated kernel builds and supports multiple versions and configurations. The kernel is fully compiled using Clang.

[![Build Kernel](https://github.com/HowWof/KernelSU_Builder/actions/workflows/build_kernel.yml/badge.svg)](https://github.com/HowWof/KernelSU_Builder/actions/workflows/build_kernel.yml)
[![Watch KernelSU](https://github.com/HowWof/KernelSU_Builder/actions/workflows/watch_ksu.yml/badge.svg)](https://github.com/HowWof/KernelSU_Builder/actions/workflows/watch_ksu.yml)

## Table of Contents
- [Building Kernel](#building-kernel)
- [Flashing the Kernel](#flashing-the-kernel)

## Building Kernel

Follow these steps to use this Builder:

1. Fork this repository.
2. Update the `sources.yaml` file with your build sources and provide AnyKernel3.
3. Set up the necessary secrets in your repository settings. The required secret is `GH_PAT`: A personal access token with the `repo` scope.
4. Trigger the GitHub Actions workflow manually or wait for it to be triggered automatically on each push.
5. The builder will compile the kernel using Clang and create a release on the GitHub repository.

## Flashing the Kernel

To flash the kernel onto your device:

1. Go to the GitHub repository's releases page and download the latest build.
2. Boot your device into recovery mode.
3. Select 'Install' and navigate to the downloaded kernel zip file.
4. Swipe to confirm the flash.
5. Reboot your device.

Please note that this workflow is provided as-is without any warranties. Use it at your own risk. Ensure compatibility and follow device-specific guidelines before flashing custom kernels. Read and understand the installation instructions and warnings before proceeding with kernel installation.