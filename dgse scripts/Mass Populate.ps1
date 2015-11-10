. "M:\Marketing Staff\Technical Marketing Folder\Powershell scripts\Utility Functions.ps1" 

########################
#   MASS POPULATE SCRIPT
########################

while($true)
{
################################################################################################################################################################
##Public Populate ##############################################################################################################################################
################################################################################################################################################################

    $demoData = "M:\Demo\Data Sets\New Folder structure"
    foreach ($user in $Users) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Public" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.9.50\Public" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 300 -maximum 500
    ###Populate Fake Folders
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to Public directory"
        
    $count2 = Get-Random -minimum 50 -maximum 150
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 10 -maximum 50
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
    }  
 
#######################################################################################################################################################################
##Administration$ Populate ##############################################################################################################################################
################################################################################################################################################################

    $demoData = "M:\Demo\Data Sets\New Folder structure\Administration"
    foreach ($user in $AdministrationUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Administration$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Administration$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 50 -maximum 200
	
    $count99 = Get-Random -minimum 1 -maximum 5
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Executives" $count
    Write-host "Copied $count to directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\Team Folder" $count
    Write-host "Copied $count to directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\Directors" $count
    Write-host "Copied $count to directory"
    } 
    
    If ($count99 -eq 4)
    {
    CopyRandom $demoData "L:\Senior Managers" $count
    Write-host "Copied $count to directory"
    } 

    If ($count99 -eq 5)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to directory"
    } 

    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  
 
#######################################################################################################################################################################
##Finance$ Populate ##############################################################################################################################################
################################################################################################################################################################

    $demoData = "M:\Demo\Data Sets\New Folder structure\Finance"
    foreach ($user in $FinanceUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Finance$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Finance$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 100 -maximum 300
	
    $count99 = Get-Random -minimum 1 -maximum 5
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Quarterly Reports" $count
    Write-host "Copied $count to directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\Stock Incentive Plan" $count
    Write-host "Copied $count to directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\Invoices" $count
    Write-host "Copied $count to directory"
    } 
    
    If ($count99 -eq 4)
    {
    CopyRandom $demoData "L:\Taxes" $count
    Write-host "Copied $count to directory"
    } 

    If ($count99 -eq 5)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to directory"
    }     
    
    
    $count2 = Get-Random -minimum 30 -maximum 75
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 5 -maximum 20
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  
 
#######################################################################################################################################################################
##HR$ Populate ##############################################################################################################################################
################################################################################################################################################################

#$demoData = "M:\Demo\Data Sets\New Folder structure\HR"
$demoData = "M:\Demo\Data Sets\New Folder structure\Public"

 foreach ($user in $HumanResources) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\HR$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\HR$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 50 -maximum 150
	
    $count99 = Get-Random -minimum 1 -maximum 5
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Job Postings info" $count
    Write-host "Copied $count to Quarterly Reports directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\New Hires" $count
    Write-host "Copied $count to Stock Incentive Plan directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\Personnel Records" $count
    Write-host "Copied $count to Invoices directory"
    } 
    
    If ($count99 -eq 4)
    {
    CopyRandom $demoData "L:\Policies" $count
    Write-host "Copied $count to Taxes directory"
    } 

    If ($count99 -eq 5)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to Finance directory"
    }     
    
    
    $count2 = Get-Random -minimum 30 -maximum 75
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Finance directory"
    
    $count3 = Get-Random -minimum 5 -maximum 15
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Finance directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  


#################################################################################################################################################################################
##Information Technology$ Populate ##############################################################################################################################################
#################################################################################################################################################################################

$demoData = "M:\Demo\Data Sets\New Folder structure\Information Technology"
foreach ($user in $InformationTechnologyUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Information_Technology$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Information_Technology$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 75 -maximum 200
	

    $count99 = Get-Random -minimum 1 -maximum 6
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Help Desk" $count
    Write-host "Copied $count to directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\Data Center" $count
    Write-host "Copied $count to directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\Networking" $count
    Write-host "Copied $count to directory"
    } 
    
    If ($count99 -eq 4)
    {
    CopyRandom $demoData "L:\Telecom" $count
    Write-host "Copied $count to directory"
    } 

    If ($count99 -eq 5)
    {
    CopyRandom $demoData "L:\File Services" $count
    Write-host "Copied $count to directory"
    }

    If ($count99 -eq 6)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to directory"
    }
    
          
    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  
 
#######################################################################################################################################################################
##Legal$ Populate #####################################################################################################################################################
#######################################################################################################################################################################

$demoData = "M:\Demo\Data Sets\New Folder structure\Legal"
foreach ($user in $LegalUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Legal$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Legal$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 75 -maximum 200
	
    $count99 = Get-Random -minimum 1 -maximum 7
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Case Files" $count
    Write-host "Copied $count to directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\Clients" $count
    Write-host "Copied $count to directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\Templates" $count
    Write-host "Copied $count to directory"
    } 
    
    If ($count99 -eq 4)
    {
    CopyRandom $demoData "L:\Pro Bono" $count
    Write-host "Copied $count to directory"
    } 

    If ($count99 -eq 5)
    {
    CopyRandom $demoData "L:\Secure Documents" $count
    Write-host "Copied $count to directory"
    }

    If ($count99 -eq 6)
    {
    CopyRandom $demoData "L:\Compliance" $count
    Write-host "Copied $count to directory"
    }

    If ($count99 -eq 7)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to directory"
    }
    
    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  
 
#######################################################################################################################################################################
##Marketing$ Populate #################################################################################################################################################
#######################################################################################################################################################################

$demoData = "M:\Demo\Data Sets\New Folder structure\Marketing"

foreach ($user in $MarketingUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Marketing$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Marketing$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 50 -maximum 125
	$count99 = Get-Random -minimum 1 -maximum 6
    
    
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Corporate" $count
    Write-host "Copied $count to directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\Presentations" $count
    Write-host "Copied $count to directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\Surveys" $count
    Write-host "Copied $count to directory"
    } 
    
    If ($count99 -eq 4)
    {
    CopyRandom $demoData "L:\Use Cases" $count
    Write-host "Copied $count to directory"
    } 

    If ($count99 -eq 5)
    {
    CopyRandom $demoData "L:\White Papers" $count
    Write-host "Copied $count to directory"
    }

    If ($count99 -eq 6)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to directory"
    }

    

    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  
 
#######################################################################################################################################################################
##Sales$ Populate #####################################################################################################################################################
#######################################################################################################################################################################

$demoData = "M:\Demo\Data Sets\New Folder structure\Sales"
foreach ($user in $SalesUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Sales$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Sales$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 75 -maximum 200
	
    $count99 = Get-Random -minimum 1 -maximum 3
    If ($count99 -eq 1)
    {
    CopyRandom $demoData "L:\Inside Sales" $count
    Write-host "Copied $count to directory"
    }  

    If ($count99 -eq 2)
    {
    CopyRandom $demoData "L:\Field Sales" $count
    Write-host "Copied $count to directory"
    }  
    
    If ($count99 -eq 3)
    {
    CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to directory"
    } 
   
    
    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
} 
#############################################################################################################################################################################
##Technical Services$ Populate ##############################################################################################################################################
#############################################################################################################################################################################

$demoData = "M:\Demo\Data Sets\New Folder structure\Technical Services"
foreach ($user in $TechnicalServicesUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\TechnicalServices$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\TechnicalServices$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 75 -maximum 200
	CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to Public directory"
    
    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
  
 }
#######################################################################################################################################################################
##Executives$ Populate ################################################################################################################################################
#######################################################################################################################################################################

$demoData = "M:\Demo\Data Sets\New Folder structure\Executives"
foreach ($user in $ExecutiveUsers) {
	
    
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	net use L: /delete 2>&1>null
	Start-Sleep -s 7
        
    #####Mount the Drive with Credentials
    #####Using "net use" here after much trial and error. The "> null" piece prevents things from being written to the console, but creates a file on disk called null. 
	Write-Host "`r`n Mounting the L: drive as: " $user
    Write-Host DEBUG net use L: \\"10.100.49.10\Executives$" /user:tml\$user "d@t@Gr11"
    net use L: \\"10.100.49.10\Executives$" /user:tml\$user >null
    #net use L: \\techmkt-01.tml.lab\public /user:tml\$user "d@t@Gr11" >null
    #Sleep for 5 seconds to give the OS time to complete the drive mapping.
	Start-Sleep -s 7
        
    #####Populate Drive with random stuff
    
    $count = Get-Random -minimum 75 -maximum 200
	CopyRandom $demoData "L:\" $count
    Write-host "Copied $count to Public directory"
    
    $count2 = Get-Random -minimum 10 -maximum 30
    ReadRandom "L:\" $count2
    Write-host "Read $count2 from Public directory"
    
    $count3 = Get-Random -minimum 1 -maximum 12
    DeleteRandom "L:\" $count3
    Write-host "Deleted $count3 from Public directory" 
	    
    #####Remove the mounted drive
    ###### Unmount a drive. The 2>&1>null hides any errors from the console (half of the time this gets called, there won't be a drive to unmount). 
	Write-Host "Unmounting the L: drive"
    net use L: /delete 2>&1>null
	Start-Sleep -s 10
    net use 
}  
 
#######################################################################################################################################################################
  

}