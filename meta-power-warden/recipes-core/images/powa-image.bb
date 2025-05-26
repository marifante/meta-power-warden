SUMMARY = "Linux image that proves Power Warden application ready to be used in production"

inherit core-image

IMAGE_FEATURES += "ssh-server-openssh"

# linux-firmware-rpidistro-bcm43455 needsthis license to be accepted.
# TODO: see if we can move this to a platform-dependent place.
LICENSE_FLAGS_ACCEPTED += "synaptics-killswitch"
