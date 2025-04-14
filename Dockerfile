# Use the official Open WebUI image from GitHub Container Registry
# Using ':main' tracks the latest stable release. You can pin to a specific version tag if needed.
FROM ghcr.io/open-webui/open-webui:main

# The base image's entrypoint script already handles listening on $PORT
# and the image exposes 8080, which Render can use as a hint if needed,
# but the primary mechanism is the app listening on $PORT.
# No EXPOSE or CMD needed here.
