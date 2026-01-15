# Start of strangeName ps script
Clear-Host
Get-Date
Write-Host "Beginning strangeName powershell script"
Write-Host ""

# Create variable and to store data from text file
$dataWeirdNames = Get-Content 'C:\temp\DevOps_Mentor\list_of_names.txt'

# ForEach loop with new variable $strangeName to hold data from compare conditions against original data in $dataWeirdNames variable
# For each loop will output to the screen either: "No strange name found." (on match of Aaron, John or Karman) or output "$strangeName is a strange name!" in green color
# A text file will be created to list the strange names
ForEach ($strangeName in $dataWeirdNames) {
    if ($strangeName -ne "John" -and $strangeName -ne "Karman" -and $strangeName -ne "Aaron") {
        Write-Host "$strangeName is a strange name!"  -ForegroundColor Green
        $strangeName | Out-File "C:\Temp\DevOps_Mentor\Results\strangeName_v2.txt" -Append #screwed this line up because I was starting with Get-Content $strangeName, but need to call just the variable
    } else {
        Write-Host "No strange name found."
    }
}

# Add formatted date to strangeName_v2.txt file
$Date = Get-Date -Format "yyyyMMdd"
$OriginalFilePath = "C:\Temp\DevOps_Mentor\Results\strangeName_v2.txt"
$NewFilePath = "C:\Temp\DevOps_Mentor\Results\strangeName_v2_$Date.txt"
Rename-Item -Path $OriginalFilePath -NewName $NewFilePath

# End of strangeName ps script
Write-Host ""
Write-Host "strangeName powershell script completed"