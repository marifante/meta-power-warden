SUMMARY = "Linux image that provides Power Warden application ready to be used in production"

# core-image is a class that contains common code used to generate reference images.
# https://github.com/yoctoproject/poky/blob/walnascar/meta/classes-recipe/core-image.bbclass
inherit core-image

IMAGE_FEATURES += "ssh-server-openssh splash"

IMAGE_INSTALL:append = " docker docker-compose"
