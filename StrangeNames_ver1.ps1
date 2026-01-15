# Start of ps script
Clear-Host
Get-Date
Write-Host "Beginning strangeName powershell script"
Write-Host ""

# Command to read and output data listed in text file and output to console
Get-Content -Path "C:\Temp\DevOps_Mentor\list_of_names.txt"

# Command to parse text file and match exactly Karman and output to console
Write-Host ""
Get-Content 'C:\temp\DevOps_Mentor\list_of_names.txt' | Where-Object {$_ -match 'Karman'}
Write-Host ""


# Put data from text file into powershell array
#$dataName = Import-Csv -Path "C:\Temp\DevOps_Mentor\list_of_names.txt" -Header "Name"
#Write-Host ""

# ForEach attempt
#ForEach ($dataWeirdName in $dataName){
#    if($dataWeirdName -Match 'Karman'){
#        Continue
#    }
#    else { Write-Host "Name: $dataWeirdName" }
#}

$dataWeirdNames = Get-Content 'C:\temp\DevOps_Mentor\list_of_names.txt'

ForEach ($strangeName in $dataWeirdNames) {
    if ($strangeName -ne "John" -and $strangeName -ne "Karman" -and $strangeName -ne "Aaron") {
        Write-Host "$strangeName is a strange name!"  -ForegroundColor Green
        $strangeName | Out-File "C:\Temp\DevOps_Mentor\Results\strangeName_v1.txt" -Append #screwed this line up because I was starting with Get-Content $strangeName, but need to call just the variable
    } else {
        Write-Host "No strange names found"
    }
}

#below line was before the ForEach block but put it last and used for confirmation that three odd names written twice to strangeName text file twice
Get-Content 'C:\Temp\DevOps_Mentor\list_of_names.txt' | Where-Object {$_ -ne 'Karman' -and $_ -ne 'Aaron' -and $_ -ne 'John'} | Out-File "C:\Temp\DevOps_Mentor\Results\strangeName_v1.txt" -Append

# Add formatted date to strangeName.txt file
$Date = Get-Date -Format "yyyyMMdd"
$OriginalFilePath = "C:\Temp\DevOps_Mentor\Results\strangeName_v1.txt"
$NewFilePath = "C:\Temp\DevOps_Mentor\Results\strangeName_v1_$Date.txt"
Rename-Item -Path $OriginalFilePath -NewName $NewFilePath

# End of ps script
Write-Host ""
Write-Host "strangeName powershell script completed"