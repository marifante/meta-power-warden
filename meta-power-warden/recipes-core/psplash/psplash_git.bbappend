# psplash custom recipe for powa image.
# This recipe is built upon psplash_git.bb recipe from meta core layer: https://github.com/yoctoproject/poky/blob/7c4e8e0def43305bf838f948c89b320f72e94b9e/meta/recipes-core/psplash/psplash_git.bb.
#
# During the development, the following recipes were taken as reference:
# https://github.com/Guacamayo/meta-guacamayo/blob/722040a3ed177d6ed563c49abb3bc5dd7a5367fb/meta-guacamayo/recipes-core/psplash/psplash_git.bbappend#L1
# https://github.com/agherzan/meta-raspberrypi/blob/master/recipes-core/psplash/psplash_%25.bbappend

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# psplash base recipe will convert this .png image to a .h header file.
SPLASH_IMAGES:powa = "file://psplash-powa-img.png;outsuffix=power-warden"

# psplash base recipe will create a system.d service called `psplash-systemd.service`: https://github.com/yoctoproject/poky/blob/d8b0adfaac9118777d099f76c428e088da519ff0/meta/recipes-core/psplash/files/psplash-systemd.service.
# That service will be located in /usr/lib/systemd/system/psplash-systemd.service.
# Seems like there is an issue with psplash base recipe in which it removes splash executable from bindir: https://github.com/yoctoproject/poky/blob/fd9b605507a20d850a9991316cd190c1d20dc4a6/meta/recipes-core/psplash/psplash_git.bb#L126.
# Also see: https://github.com/agherzan/meta-raspberrypi/issues/1330
# Here we are fixing that issue
do_install:append:powa() {
    bbnote "Powa: Installing psplash from ${B}/psplash to ${D}${bindir}/psplash"
    install -m 0755 ${B}/psplash ${D}${bindir}/psplash
}
