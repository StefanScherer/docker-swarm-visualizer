Write-Host Starting test

$ErrorActionPreference = 'SilentlyContinue';
docker kill visualizertest
docker rm -f visualizertest

$ErrorActionPreference = 'Stop';
Write-Host Starting container
docker run --name visualizertest -p 8080:8080 -d visualizer
$ip=$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress  }}' visualizertest)
Start-Sleep 15
Write-Host Testing from another container
docker run --rm microsoft/nanoserver powershell -command invoke-webrequest -usebasicparsing http://$($ip):8080

$ErrorActionPreference = 'SilentlyContinue';
docker kill visualizertest
docker rm -f visualizertest
