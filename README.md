# meta-dunkley
Yocto layer with various tools to aid in development. The following tools are provided:

- print-src (class)
- linux-yocto (append recipe)

A description of each tool is provided below.

## Dependencies
This layer depends on:

URI | Layers | Branch
--- | ------ | ------
git://git.openembedded.org/bitbake | | rocko
git://git.openembedded.org/openembedded-core | meta | rocko
git://git.yoctoproject.org/meta | meta | rocko

## Patches
Please submit any patches against this layer using pull requests in github or open up an issue.

## Table of Contents
1. Adding the meta-generic-zynq to your build
2. print-src
3. linux-yocto

### 1. Adding the meta-generic-zynq to your build
In order to use this layer, you need to make the build system aware of it.

Assuming the meta-generic-zynq layer exists at the top-level of your yocto build tree, you can add it to the build system by adding the location of the layer to bblayers.conf, after meta-xilinx has been added. e.g.:

```
  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-poky \
    /path/to/yocto/meta-yocto-bsp \
    /path/to/yocto/meta-xilinx \
    /path/to/yocto/meta-generic-zynq \
    "
```

### 2. print-src
This class stores the SRC_URI, package name, and package version of each file downloaded by the last fetch operation. The information is stored in a CSV file called "source_urls.csv".

### 3. linux-yocto
This appends the Yocto linux recipe to add or remove components. It is meant to be used as a simple way of removing items without having to run menuconfig during a build. You can also use it as a template to patch the kernel as needed.


