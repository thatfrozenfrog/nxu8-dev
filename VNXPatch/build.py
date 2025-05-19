import os
import sys
import glob
import subprocess
import shutil

# Change to the Release folder
os.chdir(r"E:\ccu8\VNXPatch\Release")

# Prepend the LAPIS bin folder to the PATH so hex2bin can be found
os.environ["PATH"] = r"E:\LAPIS\LEXIDE\Bin;" + os.environ["PATH"]
modelPath = r"E:\CasioMSVC\CasioEmuMsvc-stable\x64\Release\models\nxu8-lapis"

# Find the single HEX file in the current directory
hex_files = glob.glob("*.HEX")
if not hex_files:
    sys.exit("No .HEX file found in the current directory.")
hex_file = hex_files[0]

# Clear .bin files in the current directory
for file in glob.glob("*.bin"):
    try:
        os.remove(file)
    except Exception:
        pass

# Run hex2bin on the HEX file, outputting to rom.bin
result = subprocess.run(["hex2bin", os.path.abspath(hex_file)])
if result.returncode != 0:
    sys.exit("hex2bin command failed.")

# Rename the generated bin (assumed to be "<BaseName>.bin") to "rom.bin"
bin_file = os.path.splitext(hex_file)[0] + ".bin"
os.rename(bin_file, "rom.bin")

# Current location is "E:\ccu8\VNXPatch\Release"
releaseRomBinPath = r".\rom.bin"
vnxPatchFolderPath = r".."

# Resolve absolute paths for clarity and robustness
absVnxPatchFolderPath = os.path.abspath(vnxPatchFolderPath)
vnxPatchRomBinPath = os.path.join(absVnxPatchFolderPath, "rom.bin")
vnxPatchRomPatchedBinPath = os.path.join(absVnxPatchFolderPath, "rom_patched.bin")

print(f"Source rom.bin in Release folder: {os.path.abspath(releaseRomBinPath)}")
print(f"Temporary rom.bin in VNXPatch folder: {vnxPatchRomBinPath}")
print(f"Target rom_patched.bin in VNXPatch folder: {vnxPatchRomPatchedBinPath}")

# Copy the file from releaseRomBinPath to vnxPatchRomBinPath
shutil.copy2(releaseRomBinPath, vnxPatchRomBinPath)
print(f"Copied {releaseRomBinPath} to {vnxPatchRomBinPath}")

# Define the offset (3:0FC0) in bytes
# Assuming 3:0FC0 means bank 3, offset 0FC0
# If each bank is 64KB (0x10000), then offset is 3*0x10000 + 0x0FC0
source_offset = 3 * 0x10000 + 0x0FBE
target_offset = 3 * 0x10000 + 0x0FC0  # sybau ngga don't pmo

# Read data from rom.bin at the specified offset to EOF
with open(vnxPatchRomBinPath, 'rb') as source_file:
    # Get total file size
    source_file.seek(0, 2)  # Move to end of file
    file_size = source_file.tell()
    
    # Go to source offset and read until EOF
    source_file.seek(source_offset)
    data_to_copy = source_file.read()  # Read all data from offset to EOF

# Create rom_patched.bin if it doesn't exist (don't just copy rom.bin)
if not os.path.exists(vnxPatchRomPatchedBinPath):
    with open(vnxPatchRomPatchedBinPath, 'wb') as f:
        # Create a file of appropriate size
        f.write(b'\x00' * file_size)

# Backup the current rom_patched.bin into rom_patched.temp before patching
backupFile = os.path.join(absVnxPatchFolderPath, "rom_patched.temp")
shutil.copy2(vnxPatchRomPatchedBinPath, backupFile)
print(f"Backup created: {backupFile}")

# Write the copied data to rom_patched.bin at the same offset
with open(vnxPatchRomPatchedBinPath, 'r+b') as target_file:
    target_file.seek(target_offset)
    target_file.write(data_to_copy)

print(f"Successfully copied data from {vnxPatchRomBinPath} to {vnxPatchRomPatchedBinPath}")
print(f"Copied from offset {hex(source_offset)} to EOF ({len(data_to_copy)} bytes)")

# Delete the temporary rom.bin file in the main folder
if os.path.exists(vnxPatchRomBinPath):
    os.remove(vnxPatchRomBinPath)
    print(f"Deleted temporary file: {vnxPatchRomBinPath}")

# Define emulator paths
emulatorModelDir = r"E:\CasioMSVC\CasioEmuMsvc-stable\x64\Release\models\nxu8-patcher"
emulatorDir = r"E:\CasioMSVC\CasioEmuMsvc-stable\x64\Release"
emulatorExe = "CasioEmuMSVC.exe"

# Copy rom_patched.bin to the emulator's model directory (with force mode)
os.makedirs(emulatorModelDir, exist_ok=True)  # Create directory if it doesn't exist
# The emulator likely expects the ROM to be named "rom.bin", not "rom_patched.bin"
emulatorRomPath = os.path.join(emulatorModelDir, "rom.bin")
shutil.copy2(vnxPatchRomPatchedBinPath, emulatorRomPath)
print(f"Copied {vnxPatchRomPatchedBinPath} to {emulatorRomPath}")

# Restore the previous version of rom_patched.bin from backup
if os.path.exists(backupFile):
    shutil.copy2(backupFile, vnxPatchRomPatchedBinPath)
    print(f"Restored {vnxPatchRomPatchedBinPath} from backup: {backupFile}")

# Change directory to emulator location
os.chdir(emulatorDir)
print(f"Changed directory to: {os.getcwd()}")

# Execute the emulator with the specified model
emulator_cmd = [emulatorExe, "models/nxu8-patcher"]
print(f"Executing: {' '.join(emulator_cmd)}")
try:
    result = subprocess.run(emulator_cmd, timeout=10)
    print(f"Emulator exited with code: {result.returncode}")
except subprocess.TimeoutExpired:
    print("Emulator launched successfully and is running")
except Exception as e:
    print(f"Error launching emulator: {e}")
