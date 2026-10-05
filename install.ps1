# Installs or updates kumodesk on Windows:
#   irm https://raw.githubusercontent.com/snowfallen/kumodesk-releases/main/install.ps1 | iex
# A version other than the latest: $env:KUMODESK_VERSION = '0.1.0' before it.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$repo = 'https://github.com/snowfallen/kumodesk-releases'
$version = $env:KUMODESK_VERSION
if (-not $version) {
  $request = [Net.WebRequest]::Create("$repo/releases/latest")
  $response = $request.GetResponse()
  $version = ($response.ResponseUri.AbsoluteUri -split '/v')[-1]
  $response.Close()
}
if ($version -notmatch '^[0-9.]+$') { throw 'kumodesk: cannot tell the latest version' }

$file = "kumodesk-$version-setup.exe"
$setup = Join-Path $env:TEMP $file
Write-Host "Downloading $file"
Invoke-WebRequest -UseBasicParsing -Uri "$repo/releases/download/v$version/$file" -OutFile $setup
Write-Host 'Installing'
$run = Start-Process -FilePath $setup -ArgumentList '/S' -Wait -PassThru
Remove-Item $setup -Force
if ($run.ExitCode -ne 0) { throw "kumodesk: the setup ended with code $($run.ExitCode)" }
Write-Host "kumodesk $version is installed. Start it from the Start menu."
