#include <stdio.h>
#include <tiffio.h>

int main (int argc, char** argv)
{
	TIFF* tiff;
	tiff = TIFFOpen (argv[1], "r");
	if (tiff) { //agregado para evitar error de existencia

        int dircount = 0;
        do {
            dircount++;
        } while (TIFFReadDirectory(tiff));
        printf("%d directories in %s\n", dircount, argv[1]);
        TIFFClose(tiff);
    }

	return 0;
}
