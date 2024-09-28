import sys
from PIL import Image
import os

def bin_to_hex(bin_str):
    bit_s = bin_str
    inverse_s = ''.join(['1' if i == '0' else '0' for i in bit_s])
    decimal_value = int(inverse_s, 2)
    hex_string = hex(decimal_value)[2:].upper().zfill(2)
    return hex_string

def image_to_hex(image_path):
    img = Image.open(image_path).convert('1')  # Open image in binary mode
    width, height = img.size
    hex_list = []

    for y in range(height):
        for x in range(0, width, 8):  # Process 8 pixels at a time
            binary_chunk = ''
            for i in range(8):
                if x + i < width:
                    pixel = img.getpixel((x + i, y))
                    if pixel == 0:
                        binary_chunk += '0'
                    else:
                        binary_chunk += '1'
                else:
                    binary_chunk += '1'  # Fill with 0 for odd pixels at the edge
            hex_list.append(bin_to_hex(binary_chunk))

    return hex_list

def write_binary_file(filename, hex_list):
    binary_data = bytearray(int(h, 16) for h in hex_list)
    with open(filename, 'wb') as f:
        f.write(binary_data)

def main():
    # Check if image path is provided as a command-line argument
    if len(sys.argv) < 2:
        print("Usage: python script_name.py <image_path>")
        return

    image_path = sys.argv[1]

    # Get the base name of the file without the extension
    base_name = os.path.splitext(os.path.basename(image_path))[0]

    # Define the output binary file path using the base name
    output_file = f'{base_name}.bin'
    
    # Convert the image to a list of hex values
    hex_list = image_to_hex(image_path)
    
    # Write the binary data to a file
    write_binary_file(output_file, hex_list)
    
    print(f"Binary file written to {output_file}")

if __name__ == "__main__":
    main()
