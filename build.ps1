$ErrorActionPreference = 'Stop';
Write-Host Starting build

docker build --pull -t visualizer -f Dockerfile.windows .

docker images
