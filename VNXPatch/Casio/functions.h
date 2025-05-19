#include "types.h"


/* @brief Render a 1bpp bitmap
 * @param x: x position on screen (0 - 192)
 * @param y: y position on screen (1 - 64)
 * @param w: width of the bitmap (px)
 * @param h: height of the bitmap (px)
 * @param bitmap: pointer to the bitmap data (1bpp)
 * @note: The bitmap is stored in a 2D array, with each byte representing a row of pixels.
 *        The first bit of the byte corresponds to the leftmost pixel in the row.
 * @warning: Ensure that the bitmap array has exactly row bytes.
 */
extern void render_bitmap(byte x, byte y, byte w, byte h, word bitmap);
/* @brief Fill buffer with a pattern
 * @param pat: bit pattern (1bpp) to fill the screen with
 * @param mode: screen selection mode (bitmask):
 *              bit 0: clear DDD4,
 *              bit 1: clear real screen,
 *              bit 2: clear E3D4
 */
extern void fill_screen(byte pat, byte mode);

/// @brief Memzero function
/// @param addr address to start clearing memory from
/// @param size number of bytes to clear
extern void memzero(word addr, word size);


/// @brief Print a string to the screen
/// @param x x position on screen (0 - 192)
/// @param y y position on screen (1 - 64)
/// @param str pointer to the string to print
/// @note The string should be null-terminated.
///       String: char *str[] = "Hello World!\00";
///       The function will print the string starting from the specified (x, y) position.
///       Set the font size at ram:00d136
extern void lineprint(byte x, byte y, const char * str);

/// @brief Render the DDD4 screen
/// @note This function will render the DDD4 screen.
extern void render_ddd4(void);

/// @brief Stop code execution for a specified number of ticks
/// @param tick number of ticks to wait
/// @note One tick is a CPU highspeed clock.
extern void delay(word tick);


/// @brief Wait for key and store KI/KO at pointer
/// @param destination
extern void getscancode_delay(word * dest);

/// @brief Read the current key and store KI/KO at pointer. Does not halt.
/// @param destination
extern void getscancode_nodelay(word * dest);

/// @brief Convert the KI/KO to 16 bit token
/// @param pointer to kiko
/// @param lookup table
extern word convertscancode(word * kiko, word table);

/// @brief Draw a line from (x1, y1) to (x2, y2)
/// @param x1 x position of the first point
/// @param y1 y position of the first point
/// @param x2 x position of the second point
/// @param y2 y position of the second point
extern void line_draw(byte x1, byte y1, byte x2, byte y2);
