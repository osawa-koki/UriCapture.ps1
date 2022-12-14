Clear-Host

while ($true) {
  $url_default = "http://example.com/dir1/dir2/dir3/file"

  $uri = Read-Host "enter uri here (default: $url_default) -> ".Trim()

  Clear-Host

  if (($uri -eq "bye") -or ($uri -eq "exit")) {
    Write-Output "bye..."
    Exit
  }

  # URIが指定されなければ、、、
  if ([string]::IsNullOrEmpty($uri)) {
    $uri = $url_default
  }

  $domain_pattern = "(?<SCHEME>https?|wss?)://(?<DOMAIN>[\d\w\.\-_]+)/?"

  if (!($uri -match $domain_pattern)) {
    Write-Output "invalid uri -> $uri"
    continue
  }
  
  $scheme = $Matches["SCHEME"]
  $domain = $Matches["DOMAIN"]

  Write-Output "===== your scheme ====="
  Write-Output $scheme
  Write-Output "===== your domain ====="
  Write-Output $domain
  Write-Output "===== =========== ====="
}
