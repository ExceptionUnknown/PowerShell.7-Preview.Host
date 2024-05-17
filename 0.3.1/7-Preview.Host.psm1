$Private = {Get-ChildItem -Path $PSScriptRoot\.Private\*.ps1}
$HostConfig = {Import-PowerShellDataFile -Path $PSScriptRoot\.config\7Preview.Host_globalConfig.psd1}

ForEach ($Script in $Private) {
    . $Script
}

Export-ModuleMember -Variable Profile.CurrentUserPreviewHost ; Profile.AllUsersPreviewHost