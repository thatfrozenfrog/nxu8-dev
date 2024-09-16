def overwrite_binary_file(source_file_path, target_file_path, offset):
    # Read data from the source file
    with open(source_file_path, 'rb') as source_file:
        data_to_write = source_file.read()

    # Open the target file and overwrite data at the specified offset
    with open(target_file_path, 'r+b') as target_file:
        target_file.seek(offset)
        target_file.write(data_to_write)

    print(f"Data from {source_file_path} has been written to {target_file_path} starting at offset {hex(offset)}.")

# Define file paths and offset
source_file = 'suwakOS.bin'  # Replace with your source file path
target_file = 'C:\\Users\\Admin\\Pictures\\Emulators\\NewestMSVC\\models\\fx900Suwako\\rom.bin'  # Replace with your target file path
offset = 0x3A170  # Offset where writing starts

# Call the function to overwrite the binary file
overwrite_binary_file(source_file, target_file, offset)
