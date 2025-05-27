SUMMARY = "Linux image that provides Power Warden application ready to be used in development"

require powa-image.bb

IMAGE_FEATURES += " \
  allow-empty-password \
  allow-root-login \
  empty-root-password \
"
