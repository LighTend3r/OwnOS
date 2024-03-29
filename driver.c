#define FB_GREEN     2
#define FB_DARK_GREY 8

/** fb_write_cell:
    *  Writes a character with the given foreground and background to position i
    *  in the framebuffer.
    *
    *  @param i  The location in the framebuffer
    *  @param c  The character
    *  @param fg The foreground color
    *  @param bg The background color
    */
void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg)
{
    char *fb = (char *) 0x000B8000;
    fb[i] = c;
    fb[i + 1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
}


int write(char *buf, unsigned int len) {
    for(int i = 0; i < len; i++) {
        fb_write_cell(i, buf[i], FB_GREEN, FB_DARK_GREY);
    }
}
