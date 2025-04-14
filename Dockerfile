# Use the official Open WebUI image
FROM ghcr.io/open-webui/open-webui:main

# Render provides the PORT environment variable (e.g., 10000)
# The application needs to bind to 0.0.0.0:${PORT}

# The base image likely uses an entrypoint script or a CMD like:
# CMD ["gunicorn", "--bind", "0.0.0.0:8080", ...] or similar
# We need to override this to use the $PORT variable provided by Render.

# Open WebUI backend runs with FastAPI/Uvicorn. The standard way to run it
# respecting the PORT variable is often handled by the entrypoint script.
# However, to be explicit and ensure Render compatibility, we can
# try overriding the command to launch Uvicorn directly.
# NOTE: This assumes the main FastAPI app object is located at 'main:app'
# in the working directory set by the base image. This might need adjustment
# if the internal structure of the open-webui image changes.

# Set the working directory (usually /app/backend in the official image)
WORKDIR /app/backend

# Override the command to start the backend server using the PORT env var
# Ensure HOST is 0.0.0.0 to accept external connections from Render's proxy
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]

# We no longer need EXPOSE 8080 as we are now explicitly using $PORT
# Render will automatically detect the application listening on $PORT.
