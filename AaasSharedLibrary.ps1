$version = "1.0"
Write-Output "AaaS SharedLibrary v$($version)"

function New-TempDirectory {
    return [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.IO.Path]::GetRandomFileName().Replace(".", ""))
}

# function DownloadFile(
#     [string]$Url = $(throw "Url is required"),
#     [string]$Output = $(throw "Output is required"),
#     [string]$OutputDirectory = $null
# ) {
#     if ($null -eq $OutputDirectory -or $OutputDirectory.Length -eq 0){
#         $OutputDirectory = "$PSScriptRoot"
#     }

#     if (-not (Test-Path $OutputDirectory)) {
#         New-Item -ItemType Directory $OutputDirectory
#     }

#     $outputPath = "$OutputDirectory\$Output"
#     $start_time = Get-Date

#     Write-Output "Downloading $Url to $outputPath..."

#     $wc = New-Object System.Net.WebClient
#     $wc.DownloadFile($url, $outputPath)

#     Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

#     return $outputPath
# }