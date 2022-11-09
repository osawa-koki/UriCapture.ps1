chcp 65001

cls

while ($true) {
  $url_default = "http://example.com/dir1/dir2/dir3/file"
 
  $input = Read-Host "enter uri here (default: $url_default) -> ".Trim()

  cls

  # URIが指定されなければ、、、
  if ([string]::IsNullOrEmpty($input)) {
    $input = $url_default
  }

  $domain_pattern = "(?<SCHEME>https?|wss?)://(?<DOMAIN>[\d\w\.\-_]+)/?"

  if ($input -match $domain_pattern) {
    $scheme = $Matches["SCHEME"]
    $domain = $Matches["DOMAIN"]

    Write-Output "===== your scheme ====="
    Write-Output $scheme
    Write-Output "===== your domain ====="
    Write-Output $domain
    Write-Output "===== =========== ====="
  } else {
    Write-Output "no match found"
  }
}
