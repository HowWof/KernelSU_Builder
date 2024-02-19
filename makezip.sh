#!/bin/bash

# Get ZIP name for kernel without KernelSU from GitHub environment variable
zip_no_ksu=${ZIP_NO_KSU}

# Get ZIP name for kernel with KernelSU from GitHub environment variable
zip_ksu=${ZIP_KSU}

# Copy the kernel image to the AnyKernel3 directory and store the names of the copied files in an environment variable
COPIED_FILES=""
for file in outw/false/*; do
    cp "$file" AnyKernel3
    COPIED_FILES="${COPIED_FILES} $(basename $file)"
done

# Enter AnyKernel3 directory
cd AnyKernel3

# Zip the kernel
zip -r9 "${zip_no_ksu}" *

# Move the ZIP to to Github workspace
mv "${zip_no_ksu}" "${GITHUB_WORKSPACE}/"

# Remove the copied files from the AnyKernel3 directory
for file in $COPIED_FILES; do
    rm -f "$file"
done

# Enter github workfpace
cd "${GITHUB_WORKSPACE}"

# Copy the kernel image with KernelSU support to the AnyKernel3 direoctory and store the names of the copied files in an environment variable
COPIED_FILES=""
for file in outw/true/*; do
    cp "$file" AnyKernel3
    COPIED_FILES="${COPIED_FILES} $(basename $file)"
done

# Enter AnyKernel3 directory
cd AnyKernel3

# Zip the kernel
zip -r9 "${zip_ksu}" *

# Move the ZIP to to Github workspace
mv "${zip_ksu}" "${GITHUB_WORKSPACE}/"
