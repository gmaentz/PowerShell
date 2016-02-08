#########################################
##  DataGravity Inc.
##  October 2015 - Updated January 2016
##  Secure files from exported CSV file
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
##
##
## Ex. ChangeFilePermissions.ps1 -ShareFilePath "\\CorporateDrive\Public" -csvFilePath "c:\temp\public.csv" -SensitiveTag "SS" -logFile "C:\Temp\FilesPermissionChanges.log"
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
    [string]$SensitiveTag,
[Parameter(Mandatory=$true)]
    [string]$logFile
 )

$SecureFileCount = 0
$SkippedFileCount = 0
$date = Get-Date


######Functions#################
#Check if the sensitive tag has been identifed
#There is a small amount of string maniuplation to be done
#tags format = ["Admin Passwords","Email","Phone Number","Postal Code","SS","URI"]
#sensitive is the sensitive item to look for
Function CheckSensitiveTag ([string]$tags, [string]$sensitive)
{
    #Write-Host $tags
    $taglist = $tags.trim([char]0x005B, [char]0x0020) #Trim Front Bracket
    $taglist = $taglist.trim([char]0x005D, [char]0x0020) #Trim Back Bracket

    $tagarray = $taglist.split(",");

    foreach ($t in $tagarray)
    {
        #Replace Quotes and Trim
        $t = $t -replace [char]0x0022, [char]0x0020 
        $t = $t.Trim()
        If ($t -eq $sensitive) {return $true}
    }

 }

#Secure the file.  Specify the file and operation used to secure it
#Also logs the permissions both before and after the file has been secured    
Function SecureFile ([string]$file, [string]$operation)
{
    # Secure the File
    "Securing $file" | Out-File $logFile -append

    #Log current permissions before securing
    "Current Permissions" | Out-File $logFile -append
    Get-Acl $file | Format-List | Out-File $logFile -append
    
    #Set New security on file
    #Set the permissions that will be used to secure the file
    $acl = Get-Acl $file
    $permission = "Everyone","FullControl", $operation
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
    $acl.SetAccessRule($accessRule)
    $acl | Set-Acl $file

    #Log new permissions after securing - work in progress, as this typically results in Permission Denied
    #after a file was secured.
    #"New Permissions" | Out-File $logFile -append
    #Get-Acl $file | Format-List | Out-File $logFile -append

 }



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
    $FilePath = $_.filepath

    # Swap out / for \ in CSV file
    $FilePath = $FilePath | ForEach-Object {$_ -Replace "/","\"}
    $fullFilePath = $ShareFilePath+$FilePath
    
    If ($tags -ne "")
    {
        If (CheckSensitiveTag $tags $SensitiveTag)
        {
            Write-Host "Secure the file: " $fullFilePath
            SecureFile $fullFilePath "Deny"
            $SecureFileCount = $SecureFileCount + 1
        }
        Else
        {
            #Write-Host "Skip the file: $fullFilePath - Tag: $SensitiveTag not found"
            "Skipping $fullFilePath - Tag: $SensitiveTag not found" | Out-File $logFile -append
            $SkippedFileCount = $SkippedFileCount + 1
        }
        
    }
    Else
    {
        #Write-Host "Skip the file: $fullFilePath - No tags found"
        "Skipping $fullFilePath - No tags found" | Out-File $logFile -append
        $SkippedFileCount = $SkippedFileCount + 1
    }

}

Write-Host  
Write-Host "Secured " $SecureFileCount " files."  
Write-Host "Skipped " $SkippedFileCount " files." 
