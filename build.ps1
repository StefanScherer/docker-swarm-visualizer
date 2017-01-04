$ErrorActionPreference = 'Stop';
Write-Host Starting build

Write-Host Updating base images
docker pull microsoft/windowsservercore
docker pull microsoft/nanoserver

Write-Host Removing old images
$ErrorActionPreference = 'SilentlyContinue';
docker rmi $(docker images --no-trunc --format '{{.Repository}}:{{.Tag}}' | sls -notmatch -pattern '(REPOSITORY|microsoft\/(windowsservercore|nanoserver))')
$ErrorActionPreference = 'Stop';
Write-Host Prune system
docker system prune -f

docker build -t visualizer -f Dockerfile.windows .

docker images
