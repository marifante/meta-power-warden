# Power Warden yocto layer

This yocto layer provides recipes for the Power Warden project.
A linux image with power warden application and its dependencies can be built with this layer.

## Supported platforms

This layer support the following platforms:

- Raspberry Pi 3B / 3B+
- Raspberry Pi 4

## Example configurations

You can find example configurations to build an image with kas in `kas/` directory:

- `kas/powa-raspberrypi3.yml`: kas configuration image to build image for raspberry pi 3B and 3B+.

In order to build an image with kas, you need to have `kas` installed in your environment and run the following command:

```bash
kas build kas/powa-raspberrypi3.yml
```

If you don't want to setup kas and yocto dependencies in your environment, you can use the docker image provided in the following repository: https://github.com/marifante/yocto_tales.
To download the latest docker image, just pull the latest tag:

```bash
docker pull marifante/yocto_tales:latest
```

## Recipes

The custom recipes provided in this layer are:

1. `recipes-core/images/powa-image.bb`: creates production image with Power Warden application and its dependencies.
2. `recipes-core/images/powa-dev-image.bb`: creates development image with Power Warden application and its dependencies. This development image has some stuff useful for develpment, but it should not be used in production. For example, with this image you can login into root without password.

### Recipes in progress

1. `recipes-core/psplash/psplash_git.bbapend`: customize psplash to show Powa logo on boot.
2.

## How to build (example for raspberry pi 3)

1. Create your own kas configuration file or use the example provided in `kas/powa-raspberrypi3.yml`.
2. Run `kas build powa-raspberrypi3.yml` to build the image (or the kas configuration file you created).
3. After the build is finished, you can find the image in `build/tmp/deploy/images/raspberrypi3/powa-image-raspberrypi3.rootfs.wic.bz2`. Uncompress it with `bunzip2`. Be wary that sometimes `bunzip2` does not work properly because the image is a symbolic link to another file. For that reason, use shell redirection to uncompress the image:

```bash
bunzip2 < "powa-image-raspberrypi3.rootfs.wic.bz2" > "powa-image-raspberrypi3.rootfs.wic"
```

4. Burn the image to an SD card using bmaptool:

```bash
bmaptool copy powa-image-raspberrypi3.rootfs.wic /dev/<your_media>
```

## Testing in QEMU

You can also test the image in QEMU. To do that, you can use as an example the kas configuration file `kas/powa-dev-qemu.yml`.
After building the image with `kas build kas/powa-dev-qemu.yml`, you can run the image in QEMU with the following command: `runqemu qemuarm nographic`.
