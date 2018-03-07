Docker container for testing ARC-GNU using dejagnu
================

This project is a simple docker container for testing ARC-GNU toolchain using
dejagnu.

Prerequisites:

1. Valid docker immage containing ARC-GNU elf32 toolchain,
see: https://github.com/claziss/arc-gnu-docker

2. Valid copy of nSIM or nSIMfree placed into the folder where Dockerfile is
located. It must be a .tar.gz file having the name support.tar.gz

Building the container:

- make build


Inspecting the resulted image:

- make shell
    and then one can navigate to /usr/src/arc/testing for gcc.log inspection.
