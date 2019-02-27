###################################################################################################
# Appends the Yocto Linux recipe. This file allows you to quickly remove or add some components to
# the kernel without having to run menuconfig.
#
# Copyright Richard Dunkley 2018
###################################################################################################

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"

SRC_URI += " \
	file://remove_btrfs.cfg \
	file://remove_can.cfg \
	file://remove_nfsclient.cfg \
	file://remove_raid.cfg \
	file://remove_scsi.cfg \
	file://remove_spi.cfg \
	file://remove_usb.cfg \
	file://add_uio.cfg \
	"
