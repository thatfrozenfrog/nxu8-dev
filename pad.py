import os

def pad_to_256kb(input_file, output_file):
    # Desired size in bytes (256 KB)
    target_size = 256 * 1024  # 256 KB

    # Read the input file
    with open(input_file, 'rb') as f:
        data = f.read()

    # Get the current size of the file
    current_size = len(data)

    # Calculate the number of padding bytes needed
    if current_size < target_size:
        padding_needed = target_size - current_size
        padding = b'\xFF' * padding_needed
        data += padding

    # Write the padded data to the output file
    with open(output_file, 'wb') as f:
        f.write(data)

    print(f"File {output_file} has been padded to {target_size} bytes.")

# Example usage
input_file = 'MAIN.bin'
output_file = 'output_padded.bin'
pad_to_256kb(input_file, output_file)
