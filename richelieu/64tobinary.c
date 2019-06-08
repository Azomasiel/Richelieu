#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>


void main()
{
    char buf[1];
    int src = open("./contentpdf", O_RDONLY, 00777);

    int dst = open("./contentpdfbinary", O_WRONLY | O_CREAT | O_TRUNC, 00777);
    for(;;)
    {
        int x = read(src, buf, 1);

    }
}
