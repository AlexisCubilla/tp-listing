#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

char* read_from_file (const char* filename, size_t length)
{
  char* buffer;
  int fd;
  ssize_t bytes_read;

  /* Allocate the buffer.  */
  buffer = (char*) malloc (length);
  if (buffer == NULL)
    return NULL;
  /* Open the file.  */
  fd = open (filename, O_RDONLY);
  if (fd == -1) {
    /* open failed.  Deallocate buffer before returning.  */
    printf("el archivo no existe\n");//agregado
    printf("se procede a liberar el buffer\n");
    free (buffer);
    return NULL;
  }
  /* Read the data.  */
  bytes_read = read (fd, buffer, length);
  if (bytes_read != length) {
    /* read failed.  Deallocate buffer and close fd before returning.  */
    printf("error en la lectura en el buffer\n");//agregado
    printf("se procede a liberar el buffer y cerrar el archivo\n");
    free (buffer);
    close (fd);
    return NULL;
  }
  /* Everything's fine.  Close the file and return the buffer.  */
  close (fd);
  return buffer;
}

int main()
{
  char archivo[]="text.txt"; //archivo no existente para probar la liberacion del buffer
 
  size_t st =strlen(archivo);
  
  char *puntero=read_from_file (archivo,st);

  if(puntero!=NULL)
  {
      printf("operacion exitosa");
  }
  return 0;

}
