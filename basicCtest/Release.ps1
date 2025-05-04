# Change to the Release folder
Set-Location "E:\ccu8\basicCtest\Release"

# Prepend the LAPIS bin folder to the PATH so hex2bin can be found
$env:Path = "E:\LAPIS\LEXIDE\Bin;" + $env:Path
$modelPath = "E:\CasioMSVC\CasioEmuMsvc-stable\x64\Release\models\nxu8-lapis"
# Find the single HEX file in the current directory
$hexFile = Get-ChildItem -Filter *.HEX | Select-Object -First 1
if (-not $hexFile) {
    Write-Error "No .HEX file found in the current directory."
    exit 1
}

# Clear .bin files in the model path
Remove-Item ".\*.bin" -ErrorAction SilentlyContinue

# Run hex2bin on the HEX file, outputting to rom.bin
hex2bin $hexFile.FullName
$binFile = "$($hexFile.BaseName).bin"
Rename-Item $binFile -NewName "rom.bin"

# "Copy" rom.bin to a variable. Here we resolve its full path.
Copy-Item "rom.bin" -Destination $modelPath -Force
# Change directory to the folder containing rom.bin
Set-Location ($modelPath)

# Go back 2 folders
Set-Location ..\..

# Run CasioEmuMSVC.exe
$lastFolder = Split-Path $modelPath -Leaf
$secondLastFolder = Split-Path (Split-Path $modelPath -Parent) -Leaf
$extractedPath = ".\$secondLastFolder\$lastFolder\"

.\CasioEmuMSVC.exe $extractedPath