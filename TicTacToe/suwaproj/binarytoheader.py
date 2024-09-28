import sys
import os
def binary_to_c_array(file_path, array_name="image_raw"):
    # Read binary data from the file
    with open(file_path, "rb") as binary_file:
        binary_data = binary_file.read()

    # Start generating the C array format
    c_array = f"const unsigned char {array_name}[] = {{\n    "
    
    # Convert each byte to the "0xXX" format and group them into lines
    line = []
    for i, byte in enumerate(binary_data):
        line.append(f"0x{byte:02X}")
        # Group into rows of 8 bytes
        if (i + 1) % 8 == 0:
            c_array += ", ".join(line) + ",\n    "
            line = []
    
    # Append any remaining bytes in the final line
    if line:
        c_array += ", ".join(line) + ",\n"

    # Close the array definition
    c_array += "};"

    return c_array

def main():
    # Usage example
    if len(sys.argv) < 2:
        print("Usage: python binarytoheader.py <bin_path>")
        return
    binary_file_path = sys.argv[1]
    base_name = os.path.splitext(os.path.basename(binary_file_path))[0]
    c_code = binary_to_c_array(binary_file_path)
    
    # Save the result to a .c file or print
    with open(f"{base_name}.h", "w") as output_file:
        output_file.write(c_code)

    # Optionally, print the result
    print(c_code)
    
if __name__ == "__main__":
    main()

