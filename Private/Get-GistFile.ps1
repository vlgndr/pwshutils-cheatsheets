Function Get-GistFile {
  param (
    [string]$Url
  )

  try {
    Write-Verbose "You are about to Invoke-WebRequest this url : $url"
    $response = Invoke-WebRequest -Uri $url -ErrorAction Stop
    if ($response) {
      Write-Verbose "Response received from $url"
    }
    $plainText = $response.Content
    $csvObject = $plainText | ConvertFrom-Csv
    return $csvObject
  }
  catch {
    Write-Error "Download failed. Please check your network connectivity."
    return $null
  }

}