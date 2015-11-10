# Utility Functions.ps1


####################
## Define All user groups
####################

$AdministrationUsers = @("dclayborn","DGoebel","WBailey","ABrinkley","mcappa","mcappaert","mcapparelli")
$ExecutiveUsers = @("rdale","mcappas")
$FinanceUsers = @("gseward","ekeeter","jbaker","kjarrett","lpropst","lhorton","lpotts","rsmallwood","mcappel","mcappellano","mcappelletti","mcappelli","mcappellini","mcappello","mcappelluti","mcapper")
$AuditUsers = @("mcappel")
$InformationTechnologyUsers = @("mclarkhill","eearp","mrobertson","ssummerlin","sclark","rwatson","mfleitas","mfleites","mfleitman","mflem","ofleming","oflemings")
$LegalUsers = @("rleak","jpowell","oflemister","oflemm")
$MarketingUsers = @("dclayborn","anelson","jprice","jcaudle","wvenable","wcooley","charris","eyoung","wrainey","fstainback","oflemming","oflemmings","oflemmon","oflemmons","rflemons","rheydenreich","rheydt","rheyduck","rheye")
$TDEndUsers = @("TestDriveUser00", "TestDriveUser01", "TestDriveUser04", "TestDriveUser07")
$SalesUsers = @("ctowns","ssasser","lmartin","warrington","aharris","pparker","gwilson","rhuggins","jcassady","dross","nbolan","pfrederick","dlucas","rray","mflood","rheyen","rheyer","rheyes","rheying","rheykoop","rheyl","rheyliger","theyman","theymann","theyn","theyne","tmountain","tmountcastle","tmountford","tmountjoy")
$HumanResources = @("jbanks","mhurts","ffurter","amichels","mlovely","shelbling","json","pshell")

$TechnicalServicesUsers = @("cburchette","plamm","mhayes","tcooke","wholloman","fmanning","bstephenson","ecopeland","dhutto","lenglish",
"cmatthews","rpeace","taycock","jwarlick","msanders","twalston","emozingo","njohnson","vsmith","tharris","cevans","bblack","mmclean","sstokes","hcarroll","wwilson",
"tmedlin","hcampbell","aharless","agriffith","tbriggs","lhannah","gjudd","ejarrell","erhodes","vrohlfs","cwilliams","elangley","nyoung","brhodes","wunderhill",
"ebullock","sbrown","clee","vwood","vchamblee","gbobbitt","ctravis","mjones","epearce","cnewcomb","lthomas","wbarque","hhowell","mnooney","dpickral","mlong",
"hwilliams","dpearce","ghayman","lpennix","rbroughton","dbarbour","lmoore","prose","rhilliard","mbarlow","iallen","sstrickland","djohnson","lennis","wallen",
"hmial","hmidgette","mjohnson","ktart","rrouse","rwhitley","ebrown","ejohnson","lstevenson","cmcfaddin","hrose","ngreen","adenton","mmartin","srooker",
"lcole","lhaithcock","arooker","cmurphy","mmckeown","mwoodlief","whoward","rfellers","mbarker","jjoyner","rfranklinjr","bfranklin","mwaqqas","amounts",
"amoura","amourad","bmoure","bmourer","bmouret","bmourino","bmouritsen","bmourning","bmoury","bmousa","bmouse","bmousel","bmouser","bpierotti","bpierpoint",
"bpierpont","bpierre","bpierri","bpierrie","bpierro","bpierron","bpierrot","bpierrott","bpiersall","bpiersaul","cpiersiak","cpiersol","cpierson","cpiertraccini",
"cpierzchala","cpies","crounds","croundtree","croundy","crounkles","crounsaville","drounsville","drountree","droup","droupe","droura","drourk","drourke",
"drous","drousch","drouse","dtravis","dshetterly","dshettle","dshettleroe","dshettsline","dshetz","dsheu","dsheumaker","dshevenell","dshevitz","dshevlin",
"eshew","esheward","eshewbridge","eshewchuk","etepp","etepper","etepperberg","eteppo","eteque","eterada","eteramoto","eteran","eterando","eteranishi","eterault",
"eteravainen","eterazes","eterboss","eazuma","eazure","eazzano","eazzara","eazzarella","eazzarito","eazzaro","eazznara","fazzopardi","fba","fbaab","fbaack",
"fbaade","fbaadsgaard","fbaar","fbaars","fbaarts","fbaas","fbaatz","fbab","fbaba","fbabat","fbabauta","fbabb")

#this is all users
$users = @("dgoebel","wbailey","abrinkley","rdale","gseward","ekeeter","jbaker","kjarrett","lpropst","lhorton","lpotts","rsmallwood","mclarkhill","eearp","mrobertson",
"ssummerlin","sclark","rwatson","rleak","jpowell","anelson","jprice","jcaudle","wvenable","wcooley","charris","eyoung","wrainey","fstainback","ctowns","ssasser",
"lmartin","warrington","aharris","pparker","gwilson","rhuggins","jcassady","dross","nbolan","pfrederick","dlucas","rray","mflood","cburchette","plamm","mhayes",
"tcooke","wholloman","fmanning","bstephenson","ecopeland","dclayborn","dhutto","lenglish","cmatthews","rpeace","taycock","jwarlick","msanders","twalston","emozingo","njohnson",
"vsmith","tharris","cevans","bblack","mmclean","sstokes","hcarroll","wwilson","tmedlin","hcampbell","aharless","agriffith","tbriggs","lhannah","gjudd","ejarrell",
"erhodes","vrohlfs","cwilliams","elangley","nyoung","brhodes","wunderhill","ebullock","sbrown","clee","vwood","vchamblee","gbobbitt","ctravis","mjones","epearce",
"cnewcomb","lthomas","wbarque","hhowell","mnooney","dpickral","mlong","hwilliams","dpearce","ghayman","lpennix","rbroughton","dbarbour","lmoore","prose","rhilliard",
"mbarlow","iallen","sstrickland","djohnson","lennis","wallen","hmial","hmidgette","mjohnson","ktart","rrouse","rwhitley","ebrown","ejohnson","lstevenson","cmcfaddin",
"hrose","ngreen","adenton","mmartin","srooker","lcole","lhaithcock","arooker","cmurphy","mmckeown","mwoodlief","whoward","rfellers","mbarker","jjoyner","rfranklinjr",
"bfranklin","mwaqqas","mcappa","mcappaert","mcapparelli","mcappas","mcappel","mcappellano","mcappelletti","mcappelli","mcappellini","mcappello","mcappelluti","mcapper",
"mfleitas","mfleites","mfleitman","mflem","ofleming","oflemings","oflemister","oflemm","oflemming","oflemmings","oflemmon","oflemmons","rflemons","rheydenreich",
"rheydt","rheyduck","rheye","rheyen","rheyer","rheyes","rheying","rheykoop","rheyl","rheyliger","theyman","theymann","theyn","theyne","tmountain","tmountcastle",
"tmountford","tmountjoy","amounts","amoura","amourad","bmoure","bmourer","bmouret","bmourino","bmouritsen","bmourning","bmoury","bmousa","bmouse","bmousel","bmouser",
"bpierotti","bpierpoint","bpierpont","bpierre","bpierri","bpierrie","bpierro","bpierron","bpierrot","bpierrott","bpiersall","bpiersaul","cpiersiak","cpiersol",
"cpierson","cpiertraccini","cpierzchala","cpies","crounds","croundtree","croundy","crounkles","crounsaville","drounsville","drountree","droup","droupe","droura",
"drourk","drourke","drous","drousch","drouse","dtravis","dshetterly","dshettle","dshettleroe","dshettsline","dshetz","dsheu","dsheumaker","dshevenell","dshevitz",
"dshevlin","eshew","esheward","eshewbridge","eshewchuk","etepp","etepper","etepperberg","eteppo","eteque","eterada","eteramoto","eteran","eterando","eteranishi",
"eterault","eteravainen","eterazes","eterboss","eazuma","eazure","eazzano","eazzara","eazzarella","eazzarito","eazzaro","eazznara","fazzopardi","fba","fbaab",
"fbaack","fbaade","fbaadsgaard","fbaar","fbaars","fbaarts","fbaas","fbaatz","fbab","fbaba","fbabat","fbabauta","fbabb")

# This is 100 users long
#$100users = @("DGoebel","WBailey", "ABrinkley","RDale","GSeward","EKeeter","JBaker","KJarrett","LPropst","LHorton","LPotts","RSmallwood","MClarkhill","EEarp","MRobertson","SSummerlin","SClark","RWatson","RLeak","JPowell","ANelson","JPrice","JCaudle","WVenable","WCooley","CHarris","EYoung","WRainey","FStainback","CTowns","SSasser","LMartin","WArrington","AHarris","PParker","GWilson","RHuggins","JCassady","DRoss","NBolan","PFrederick","DLucas","RRay","MFlood","CBurchette","PLamm","MHayes","TCooke","WHolloman","FManning","BStephenson","ECopeland","DHutto","LEnglish","CMatthews","RPeace","TAycock","JWarlick","MSanders","TWalston","EMozingo","NJohnson","VSmith","THarris","CEvans","BBlack","MMclean","SStokes","HCarroll","WWilson","TMedlin","HCampbell","AHarless","AGriffith","TBriggs","LHannah","GJudd","EJarrell","ERhodes","VRohlfs","CWilliams","ELangley","NYoung","BRhodes","WUnderhill","EBullock","SBrown","CLee","VWood","VChamblee","GBobbitt","CTravis","MJones","EPearce","CNewcomb","LThomas")

# This is 50 users long
#$50users = @("DGoebel","WBailey","ABrinkley","RDale","GSeward","EKeeter","JBaker","KJarrett","LPropst","LHorton","LPotts","RSmallwood","MClarkhill","EEarp","MRobertson","SSummerlin","SClark","RWatson","RLeak","JPowell","ANelson","JPrice","JCaudle","WVenable","WCooley","CHarris","EYoung","WRainey","FStainback","CTowns","SSasser","LMartin","WArrington","AHarris","PParker","GWilson","RHuggins","JCassady","DRoss","NBolan","PFrederick","DLucas","RRay","MFlood","CBurchette","PLamm")

# This is the TestDrive user list
#$tdusers = @("DGoebel","WBailey","ABrinkley","RDale","GSeward","EKeeter","JBaker","KJarrett","LPropst","LHorton","LPotts","RSmallwood","MClarkhill","EEarp","MRobertson","SSummerlin","SClark","RWatson","RLeak","JPowell","ANelson","JPrice","JCaudle","WVenable","WCooley","CHarris","EYoung","WRainey","FStainback","CTowns","SSasser","LMartin","WArrington","AHarris","PParker","GWilson","RHuggins","JCassady","DRoss","NBolan","PFrederick","DLucas","RRay","MFlood","CBurchette","PLamm","TestDriveUser00","TestDriveUser01","TestDriveUser04","TestDriveUser07")


#$dgServer = "bosarray01.pml.com"
#$demoData = "M:\marketing\Demo\Data Sets\New Folder structure\Public"
$drive = "l"
#$homeDir = "Home$"
#$publicDir = "Public$"
#$marketingDir = "Marketing$"
#$AdministrationDir = "Administration$"
#$FinanceDir = "Finance$"



function Read-File($filePath)
{
	$file = New-Object System.IO.StreamReader -Arg "$filePath"
	$tmp = $file.ReadLine()
	$file.close()
}

function Read-All($files) 
{
	foreach ($file in $files) {
		if ( $file -isnot [io.directoryinfo] ){
			Read-File "$file"
		}
	}
}

function ReadRandom($where, $count)
{
	if ($count -eq 0) {
		return
	}
    write-host "`tLooking for random data to read"
	$files = Get-ChildItem $where -recurse -include *.* | Get-Random -count $count
	foreach ($file in $files) {
		if ( $file -isnot [io.directoryinfo] ){
			Read-File "$file"
            Write-Host "`tRead: " $file
		}
	}
}

function CopyRandom($from, $to, $count)
{
	if ($count -eq 0) {
		return
	}
    write-host "`tLooking for random data to write"
	$files = Get-ChildItem $from -recurse -include *.* | Get-Random -count $count
	foreach ($file in $files) {
		$copyTo = $file.FullName -replace [Regex]::Escape($from), $to
		if ( $file -isnot [io.directoryinfo] ){
			$tmp = ([System.IO.FileInfo]$copyTo).Directory.FullName
			if (!(Test-Path -path $tmp)) {
				New-Item -path $tmp -type directory -force 
			}
			Copy-item "$file" "$copyTo" -force
			Write-Host "`t" Copy-item "$file" "$copyTo" -force

		}
	}
}

function DeleteRandom($from, $count)
{
	if ($count -eq 0) {
		return
	}
    write-host "`tLooking for random data to delete"
	$files = Get-ChildItem $from -recurse -include *.* | Get-Random -count $count
	foreach ($file in $files) {
		if ( $file -isnot [io.directoryinfo] ){
			Remove-Item -LiteralPath $file.FullName
            Write-host "`tDeleted: " $file.FullName

		}
	}
}
