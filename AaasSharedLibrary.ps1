$version = "1.0"
Write-Output "AaaS SharedLibrary v$($version)"

function New-TempDirectory {
    return [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.IO.Path]::GetRandomFileName().Replace(".", ""))
}

function DownloadFile(
    [string]$Url = $(throw "Url is required"),
    [string]$Output = $(throw "Output is required"),
    [string]$OutputDirectory = $null
) {
    if ($null -eq $OutputDirectory -or $OutputDirectory.Length -eq 0){
        $OutputDirectory = "$PSScriptRoot"
    }
    $output = "$OutputDirectory\$Output"
    $start_time = Get-Date

    Write-Output "Downloading $Url..."

    (New-Object System.Net.WebClient).DownloadFile($Url, $output)

    Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

    return $output
}