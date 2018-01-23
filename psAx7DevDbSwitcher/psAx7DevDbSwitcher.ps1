####
#AX7 Dev DB Switcher script developed to quickly switch AxDB instance in the development environment.
#Just run, specify target instance number and script will replace web.config file with prepared filed from script's folder.
#To use AX7 Dev DB Switcher please do following:
##1. Put your web.config files for AxDB instances to underlaying folders (e.g. "./dev/web.config", "./uat/web.config" etc);
##2. Modify "switch" area if necessary;
##3. Modify "$currentDirectory", "aosWebRootPath" if necessary;
##4. Run the script as administrator.
#
#MazZzDaI, v1.02-ax7, 23.01.2018
####

$currentDirectory = $PSScriptRoot + "\";
$aosWebRootPath = "J:\AosService\WebRoot";

$currInstNumFilePath = $currentDirectory + "currentInstanceNum.txt";
$currInstNum = Get-Content $currInstNumFilePath;
echo "Current instance number: " $currInstNum;

$dbNum = Read-Host -Prompt "Provide num of instance to switch:`n1. dev`n2. uat`n3. test`nNum";
$fromPath = "null";

switch($dbNum.ToLower())
{
    {($_ -eq "1")} { $fromPath = $currentDirectory + "dev\web.config" }
    {($_ -eq "2")} { $fromPath = $currentDirectory + "uat\web.config" }
    {($_ -eq "3")} { $fromPath = $currentDirectory + "test\web.config" }

    default { "Wrong input." }
}

if ($fromPath -ne "null")
{
    Copy-Item $fromPath $aosWebRootPath
    "`n"
    "Config copied: " + $fromPath
    "IIS restarting: "
    iisreset.exe
    
    $dbNum | out-file $currInstNumFilePath;
    
    "Finished"
}