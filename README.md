# Kernel Builder

[![Kernel Builder](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/build_kernel.yml/badge.svg)](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/build_kernel.yml)
[![Watch KernelSU](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/watch_ksu.yml/badge.svg)](https://github.com/RipperHybrid/KernelSU_Builder/actions/workflows/watch_ksu.yml)

This GitHub Action workflow automates the process of building a custom kernel for the Realme 8 (nashc) device. It integrates necessary dependencies, compiles the kernel, adds KernelSU support, and releases them on GitHub.

## How to Use

1. **Fork Repository:**
   Fork this repository to your GitHub account.

2. **Configure Secrets:**
   - Add your GitHub token as `GITHUB_TOKEN` in the repository secrets to enable releases.

3. **Trigger Workflow:**
   - The workflow can be triggered manually through the Actions tab in your repository or automatically on each push.

4. **Customization:**
   - Modify the workflow as needed for specific kernel configurations, dependencies, or release details.

5. **Release Management:**
   - Ensure to update release information such as kernel versions, installation instructions, warnings, and support group details in the workflow file before creating a release.

6. **Testing:**
   - Before creating a release, verify the compiled kernel files using the provided testing step in the workflow.

7. **Contributions:**
   - Contributions and improvements to the workflow are welcome through pull requests.

## Workflow Overview

- **Dependencies Setup:**
  - Installs necessary build dependencies and tools for kernel compilation.
  - Sets up ccache for faster subsequent builds.

- **Cloning Sources:**
  - Clones required repositories for clang and kernel sources.

- **Kernel Compilation:**
  - Compiles the kernel with specified configurations.
  - Extracts kernel version from the Makefile.

- **KernelSU Support:**
  - Adds support for KernelSU and compiles the kernel again.

- **Release Creation:**
  - Creates a GitHub release with relevant kernel information, installation instructions, warnings, and support group details.

## Support and Feedback

- For questions or assistance, feel free to reach out to the [Realme 8 AOSP](https://t.me/Realme8AOSPGroup) support group.
- Report issues or suggestions directly through GitHub's issue tracker.

## Disclaimer

- This workflow is provided as-is without any warranties. Use it at your own risk.
- Ensure compatibility and follow device-specific guidelines before flashing custom kernels.
- Read and understand the installation instructions and warnings before proceeding with kernel installation.
