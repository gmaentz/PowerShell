#########################################
##  DataGravity Inc.
##  January 2016
##  Find number of duplicate files and size from exported CSV file
##  Tested with DataGravity Software v2.2
##  Free to distribute and modify
##  THIS SCRIPT IS PROVIDED WITHOUT WARRANTY, ALWAYS FULLY BACK UP DATA BEFORE INVOKING ANY SCRIPT
##  ALWAYS VERIFY NO BLANK ROWS IN BETWEEN DATA IN CSV
##########################################

##########################################
## Instructions:
## 1) Use DataGravity UI to filter by files, dormant data, etc
## 2) Export CSV file
## 3) Modify script paths
## 4) Run script
##
## Ex. FindDuplicateFiles.ps1 -csvFilePath "c:\temp\sales.csv" -top 10
##
##########################################

##----------------------------------------
## Input Paramaters
##----------------------------------------

param (
[Parameter(Mandatory=$true)]
    [string]$csvFilePath,
    [int]$top
 )

## If top number is not specified then return all values
if($top -eq 0)
    {

        Import-Csv $csvFilePath | Group-Object -Property fingerprint -NoElement | 
        Sort-Object count -Descending | 
        Format-Table -AutoSize
    }
else
    {
        Import-Csv $csvFilePath | Group-Object -Property fingerprint,size | 
        Where-Object{$_.Values[0] -ne ""} | 
        Sort-Object -Property {$_.Count} -Descending | 
        Select-Object -First $top | 
        Format-Table Count,
            @{Label="Data FingerPrint";Expression={$_.Values[0]}},
            @{Label="File Size (KB)";Expression={($_.Values[1]) / 1Kb}} -Autosize
    }
