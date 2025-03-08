$NAME = "arm-none-eabi-docker-builder-v1-0"

Write-Output "Build Docker image '${NAME}' start."

Write-Output "Image doesn't exiest, building image..."
docker build --tag ${NAME} .