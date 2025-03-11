# Set the path
$path = "C:\LAPIS\LEXIDE\Bin;C:\LAPIS\LEXIDE\BuildTools\Ver.20231124\Bin;C:\LAPIS\LEXIDE\Utilities\Bin;$env:PATH"
$env:PATH = $path

# Find all C/C++ files and ASM files
$cFiles = Get-ChildItem -Recurse -Filter *.c | ForEach-Object { $_.FullName }
$asmFiles = Get-ChildItem -Recurse -Filter *.asm | ForEach-Object { $_.FullName }

# Echo the list of C files
Write-Output "C Files:"
$cFiles

# Echo the list of ASM files
Write-Output "ASM Files:"
$asmFiles

# Compile C files
foreach ($file in $cFiles) {
    $outputAsm = $($file -replace '\.c$', '.asm' -replace '^.+\\', '')
    Write-Output $outputAsm
    & ccu8 /SD /TML620906 /Om /Orp /Zc /Fa$outputAsm /Lv /ML $file
    
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}