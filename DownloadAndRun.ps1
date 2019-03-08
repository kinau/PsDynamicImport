function MyDownloadFile(
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

$downloadedScript = MyDownloadFile -Url "https://raw.githubusercontent.com/kinau/PsDynamicImport/master/AaasSharedLibrary.ps1" -Output "MySharedLibrary.ps1" -OutputDirectory "C:\\temp"
$downloadedScript

. "$downloadedScript"

$temp = New-TempDirectory
$temp