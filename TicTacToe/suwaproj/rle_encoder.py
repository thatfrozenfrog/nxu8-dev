import sys
import os
from PIL import Image

def encode_rle(binary_image):
    encoded_data = []
    
    for row in binary_image:
        current_color = 0  # Starting with black (0)
        count = 0
        row_encoded = []
        
        for pixel in row:
            if pixel == current_color:
                count += 1
            else:
                # Append the hex value of the count
                row_encoded.append(count & 0xFF)  # Convert count to hex (1 byte)
                # Flip the color
                current_color = 1 if current_color == 0 else 0
                # Start counting for the new color
                count = 1

        # Append the final count for the row in hex
        row_encoded.append(count & 0xFF)  # Convert count to hex (1 byte)
        # Append the end-of-line marker (0xFF)
        row_encoded.append(0xFF)
        
        encoded_data.append(row_encoded)
    
    return encoded_data

def convert_image_to_binary(img_path):
    # Open the image and convert it to grayscale
    img = Image.open(img_path).convert('L')
    
    # Convert grayscale to binary (0 for black, 1 for white)
    threshold = 128
    binary_image = [[1 if img.getpixel((x, y)) > threshold else 0 for x in range(img.width)] for y in range(img.height)]
    
    return binary_image

def write_rle_to_file(encoded_data, output_path):
    with open(output_path, 'wb') as f:
        for row in encoded_data:
            f.write(bytearray(row))

def main():
    if len(sys.argv) != 2:
        print("Usage: python script.py <image.png>")
        return
    
    input_image = sys.argv[1]
    
    if not os.path.exists(input_image):
        print(f"Error: File {input_image} not found.")
        return
    
    if not input_image.lower().endswith('.png'):
        print("Error: Only PNG files are supported.")
        return
    
    # Convert image to binary
    binary_image = convert_image_to_binary(input_image)
    
    # Encode the binary image with RLE
    encoded_data = encode_rle(binary_image)
    
    # Get the output file path (same name, .bin extension)
    output_file = os.path.splitext(input_image)[0] + '.bin'
    
    # Write the encoded data to the output binary file
    write_rle_to_file(encoded_data, output_file)
    
    print(f"RLE encoded binary data written to {output_file}")

if __name__ == "__main__":
    main()
