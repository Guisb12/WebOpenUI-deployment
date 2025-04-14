# Use the official Open WebUI image from GitHub Container Registry
# Using ':main' tracks the latest stable release. You can pin to a specific version tag if needed.
FROM ghcr.io/open-webui/open-webui:main

# Open WebUI listens on port 8080 by default inside the container.
# Render will automatically detect this EXPOSE instruction (or common ports like 8080)
# and map its external port to this internal port.
EXPOSE 8080

# The base image already contains the necessary CMD or ENTRYPOINT to start the application.
# No need to specify it here unless you have advanced customization needs.
