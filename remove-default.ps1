<#     
    ************************************************************************************************************ 
    Purpose:    Remove built in apps specified in the list 
    Pre-Reqs:    Windows 10 
    ************************************************************************************************************ 
 #>

#--------------------------------------------------------------------------------------------------------------- 
 # Main Routine 
 #---------------------------------------------------------------------------------------------------------------

# Get log path. Will log to Task Sequence log folder if the script is running in a Task Sequence 
 # Otherwise log to \windows\temp

echo "Uninstalling Default Apps"

# List of Applications that will be removed
# Just add a "#" before an application to prevent it from being removed

$AppsList = `
"Microsoft.3DBuilder",`
#"microsoft.windowscommunicationsapps",` (Calendar and Mail)
"Microsoft.BingFinance",`
"Microsoft.BingMaps",`
#"Microsoft.BingWeather",` (Weather)
#"Microsoft.DesktopAppInstaller",` (Used to install .appx packages)
#"Microsoft.MicrosoftStickyNotes",` (Sticky Notes new in 1607)
#"Microsoft.Windows.Photos",` (Photos)
#"Microsoft.WindowsAlarms",` (Alarms)
#"Microsoft.WindowsCalculator",` (Calculator)
#"Microsoft.WindowsCamera",` (Camera)
#"Microsoft.WindowsMaps",` (Maps)
"Microsoft.WindowsFeedbackHub",`
"Microsoft.ZuneVideo",`
"Microsoft.ZuneMusic",`
"Microsoft.Media.PlayReadyClient.2",`
"Microsoft.XboxLIVEGames",`
"Microsoft.HelpAndTips",`
"Microsoft.BingSports",`
"Microsoft.BingNews",`
"Microsoft.BingFoodAndDrink",`
"Microsoft.BingTravel",`
"Microsoft.WindowsReadingList",`
"Microsoft.BingHealthAndFitness",`
"Microsoft.Reader",`
"Microsoft.WindowsScan",`
"Microsoft.WindowsSoundRecorder",`
"Microsoft.SkypeApp",`
#"Microsoft.GetStarted",` (Added to Start Menu!)
"Microsoft.Messaging",`
"Microsoft.MicrosoftOfficeHub",`
"Microsoft.MicrosoftSolitaireCollection",`
"Microsoft.Office.OneNote",`
"Microsoft.Office.Sway",`
"Microsoft.OneConnect",`
"Microsoft.CommsPhone",`
"Microsoft.People",`
"Microsoft.WindowsPhone",`
"Microsoft.XboxIdentityProvider",`
"Microsoft.XboxApp"

ForEach ($App in $AppsList)
{
  $Packages = Get-AppxPackage | Where-Object {$_.Name -eq $App}
  if ($Packages -ne $null)
  {
      echo "Removing Appx Package: $App"
      foreach ($Package in $Packages)
      {
            Remove-AppxPackage -package $Package.PackageFullName
      }
      
  }
  else
  {
      echo "Unable to find package: $App"
  }

  $ProvisionedPackage = Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -eq $App}

  if ($ProvisionedPackage -ne $null)
  {
      echo "Removing Appx Provisioned Package: $App"
      remove-AppxProvisionedPackage -online -packagename $ProvisionedPackage.PackageName
  }
  else
  {
      echo "Unable to find provisioned package: $App"
  }

}
