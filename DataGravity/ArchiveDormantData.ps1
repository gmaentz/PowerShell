#########################################
##  DataGravity Inc.
##  October 2015 - Updated January 2016
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
## 6) Take Discovery Point and verify file deletion
## 7) Optional - Verify Archive Stubs if -ArchiveStub parameter specified
##
##
## Ex. ArchiveDormantData.ps1 -ShareFilePath "\\10.100.15.40\Sales$" -csvFilePath "c:\temp\sales.csv" -logFile "C:\Temp\DataGravity Delete From CSV.log" -ArchiveStub
##
##########################################

##----------------------------------------
## Input Paramaters
##----------------------------------------

param (
[Parameter(Mandatory=$true)]
    [string]$ShareFilePath,
[Parameter(Mandatory=$true)]
    [string]$csvFilePath,
[Parameter(Mandatory=$true)]
    [string]$logFile,
    [switch] $ArchiveStub
 )

$deletedFileCount = 0
$date = Get-Date

##########################################
## Start Logging

"Processing started (on " + $date + "): " | Out-File $logFile -append 
"--------------------------------------------" | Out-File $logFile -append 

## Import CSV and delete the file from the share and path

Import-CSV $csvFilePath | ForEach-Object {
    $shareID = $_.share_id
    $owner = $_.owner
    $lastModTime = $_.lastmodtime
    $mimeType = $_.mimeType
    $tags = $_.tags
    $size = $_.size
    $contentState = $_.contentstate
    $deleteFilePath = $_.filepath

    # Swap out / for \ in CSV file
    $deleteFilePath = $deleteFilePath | ForEach-Object {$_ -Replace "/","\"}

    # Delete the File
    $fullFilePath = $shareFilePath+$deleteFilePath
    Write-Host $fullFilePath
    Remove-Item -verbose $fullFilePath -Force

    $deletedFileCount = $deletedFileCount + 1
    "Deleting $deleteFilePath" | Out-File $logFile -append

    #Create an Archive Stub if parameter was set
    if ($ArchiveStub) { 
        # Create a new "This file has been archived" text file
        $archivedFilePath = $fullFilePath + ".archive.txt"
        Write-Host $archivedFilePath
        "This file has been deleted and archived by IT (on " + $date + ") " | Out-File $archivedFilePath -append
    }
    
    }

Write-Host "Deleted " $deletedFileCount " files."  

