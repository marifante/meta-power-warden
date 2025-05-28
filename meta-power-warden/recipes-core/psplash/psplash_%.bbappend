# psplash custom recipe for powa image.
# This recipe is built upon psplash_git.bb recipe from meta core layer: https://github.com/yoctoproject/poky/blob/7c4e8e0def43305bf838f948c89b320f72e94b9e/meta/recipes-core/psplash/psplash_git.bb.
#
# During the development, the following recipes were taken as reference:
# https://github.com/Guacamayo/meta-guacamayo/blob/722040a3ed177d6ed563c49abb3bc5dd7a5367fb/meta-guacamayo/recipes-core/psplash/psplash_git.bbappend#L1
# https://github.com/agherzan/meta-raspberrypi/blob/master/recipes-core/psplash/psplash_%25.bbappend

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# psplash base recipe will call make-image-header.sh from psplash to create a .h header file from the png image.
SPLASH_IMAGES = "file://powa_image_psplash.png;outsuffix=default"

# psplash base recipe will create a system.d service called `psplash-systemd.service`: https://github.com/yoctoproject/poky/blob/d8b0adfaac9118777d099f76c428e088da519ff0/meta/recipes-core/psplash/files/psplash-systemd.service.
