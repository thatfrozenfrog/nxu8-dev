import math

def cordic_rotate_x(x, y, z, angle_degrees, iterations=16):
    # Convert the angle from degrees to radians
    angle_radians = math.radians(angle_degrees)
    
    # Initialize variables
    xi, zi = x, z
    current_angle = 0
    
    # CORDIC gain
    K = 1.0
    for i in range(iterations):
        K *= math.sqrt(1 + 2**(-2*i))
    K = 1 / K
    
    for i in range(iterations):
        angle_shift = math.atan(2**-i)
        
        if current_angle + angle_shift <= angle_radians:
            current_angle += angle_shift
            x_new = xi
            z_new = zi + xi * (2**-i)
        else:
            current_angle -= angle_shift
            x_new = xi
            z_new = zi - xi * (2**-i)
        
        xi, zi = x_new, z_new
    
    # Apply the scaling factor K
    xi *= K
    zi *= K
    
    return xi, y, zi  # Y remains unchanged

# Example usage:
x, y, z = 1.0, 1.0, 1.0
angle_degrees = 45  # Rotate around the X-axis by 45 degrees
rotated_x, rotated_y, rotated_z = cordic_rotate_x(x, y, z, angle_degrees)
print(f"Rotated Point: ({rotated_x}, {rotated_y}, {rotated_z})")
