<#
    |--------------------------------------------------------------------------|
    .NOTES  
    |--------------------------------------------------------------------------|
    |> Microsoft PowerShell Initialization Script
    |==========================================================================|
    |> Filename: 'init_7-Preview.Host.ps1'
    |> Version: 0.5.0
    |> Author: N.W.P.
    |> Organization: Community
    |> Link: https:/www.github.com/ExceptionUnknown\PS.7-Preview.Host
    |==========================================================================|
    .DESCRIPTION
        Initialization Script for 7-Preview.Host.        
    |--------------------------------------------------------------------------| 
#>

# Relevant paths

$Script:PS7PreviewInstallPath = "C:\Program Files\PowerShell\7-preview"

$Script:PS7PreviewUserFolder = "C:\Users\$Env:USERNAME\Documents\PowerShell\7-Preview"


# Profile paths

$Script:PS7PreviewProfile=@{
    CurrentUser="$Script:PS7PreviewUserFolder\Microsoft.PowerShell.7-Preview_profile.ps1"
    AllUsers="$Script:PS7PreviewInstallPath\7-Preview_profile.ps1"

}

# Add new Profile property entries

$PROFILE | Add-Member -MemberType NoteProperty -Name 'CurrentUserPreviewHost' -Value $Script:PS7PreviewProfile.CurrentUser

$PROFILE | Add-Member -MemberType NoteProperty -Name 'AllUsersPreviewHost' -Value $Script:PS7PreviewProfile.AllUsers

# Validate relevant paths

if ((Test-Path $Script:PS7PreviewUserFolder) -eq $false) {
    New-Item $Script:PS7PreviewUserFolder -ItemType Directory
    New-Item $Script:PS7PreviewUserFolder\Modules, $Script:PS7PreviewUserFolder\Scripts -ItemType Directory
}