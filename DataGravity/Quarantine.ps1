#########################################
##  DataGravity Inc.
##  February 2016
##  Delete files from exported CSV file
##  Tested with DataGravity Software v2.2
##  Free to distribute and modify
##  THIS SCRIPT IS PROVIDED WITHOUT WARRANTY, ALWAYS FULLY BACK UP DATA BEFORE INVOKING ANY SCRIPT
##  ALWAYS VERIFY NO BLANK ROWS IN BETWEEN DATA IN CSV
##########################################

##########################################
## Instructions:
## 1) Use DataGravity UI to filter by files, dormant data, etc
## 2) Export CSV file
## 3) Use Excel/OpenOffice if more filtering is needed, use commas only not ;
## 4) Modify script paths
## 5) Run script
## 6) Take Discovery Point and verify quarantine
## 7) Optional - Verify Archive Stubs if -ArchiveStub parameter specified
##
## Ex. Quarantine.ps1 -ShareFilePath "\\CorporateDrive\Public" –QuarantineFilePath “\\CorporateDrive\Quarantine” -csvFilePath "c:\temp\public.csv" -logFile "C:\Temp\FilesPermissionChanges.log” -ArchiveStub
##
##########################################

##----------------------------------------
## Input Paramaters
##----------------------------------------

param (
[Parameter(Mandatory=$true)]
    [string]$ShareFilePath,
[Parameter(Mandatory=$true)]
    [string]$QuarantineFilePath,
[Parameter(Mandatory=$true)]
    [string]$csvFilePath,
[Parameter(Mandatory=$true)]
    [string]$logFile,
    [switch] $ArchiveStub
 )

$quarantineFileCount = 0
$date = Get-Date

##########################################
## Start Logging

"Processing started (on " + $date + "): " | Out-File $logFile -append 
"--------------------------------------------" | Out-File $logFile -append 

## Import CSV and quartantine the file from the share and path

Import-CSV $csvFilePath | ForEach-Object {
    $shareID = $_.share_id
    $owner = $_.owner
    $lastModTime = $_.lastmodtime
    $mimeType = $_.mimeType
    $tags = $_.tags
    $size = $_.size
    $contentState = $_.contentstate
    $shortFilePath = $_.filepath

    # Swap out / for \ in CSV file
    $shortFilePath = $shortFilePath | ForEach-Object {$_ -Replace "/","\"}

    # Quarantine the File
    $fullShareFilePath = $ShareFilePath+$shortFilePath
    $fullQuarantineFilePath = $QuarantineFilePath+$shortFilePath

    Write-Host $fullShareFilePath
    Write-Host $fullQuarantineFilePath
    
    Move-Item -verbose -path $fullShareFilePath -destination $fullQuarantineFilePath -Force

    $quarantineFileCount = $quarantineFileCount + 1
    "Quarantining $fullShareFilePath" | Out-File $logFile -append

    #Create an Archive Stub if parameter was set
    if ($ArchiveStub) { 
        # Create a new "This file has been archived" text file
        $archivedFilePath = $fullShareFilePath + ".archive.txt"
        Write-Host $archivedFilePath
        "This file has been quarantined by IT (on " + $date + ") because of sensitive data in contained.  The quarantine location was set to $fullQuarantineFilePath " | Out-File $archivedFilePath -append
    }
    
    }

Write-Host "Quarantined " $quarantineFileCount " files."  

