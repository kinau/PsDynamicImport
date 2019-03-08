function MyDownloadFile(
    [string]$Url = $(throw "Url is required"),
    [string]$Output = $(throw "Output is required"),
    [string]$OutputDirectory = $null
) {
    if ($null -eq $OutputDirectory -or $OutputDirectory.Length -eq 0) {
        $OutputDirectory = "$PSScriptRoot"
    }

    if (-not (Test-Path $OutputDirectory)) {
        New-Item -ItemType Directory $OutputDirectory
    }

    $outputPath = "$OutputDirectory\$Output"
    $start_time = Get-Date

    Write-Output "Downloading $Url to $outputPath..."

    try {
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($url, $outputPath)
    }
    catch {
        $ex = $_.Exception
        $ex
    }

    Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

    return $outputPath
}

$downloadedScript = MyDownloadFile -Url "https://raw.githubusercontent.com/kinau/PsDynamicImport/master/AaasSharedLibrary.ps1" -Output "MySharedLibrary.ps1" -OutputDirectory "C:\temp"
$downloadedScript

. "C:\temp\MySharedLibrary.ps1"


$temp = New-TempDirectory
$temp