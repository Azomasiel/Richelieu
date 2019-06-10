#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

void main()
{
    char inPath[] = "./prime.txt";
    char outPath[] = "./prime1generated/";

    char *searchSet[] = {"cd", "57", "54", "12", "66", "fb"};
    char *replaceSet[] = {"b5", "a4", "16", "f4", "e1", "7f"};

    char *buf = calloc(100, sizeof(char));
    char *formatedPrime = calloc(1000, sizeof(char));


    FILE *f = fopen(inPath, "r");
    //char* searching = searchSet[i];
    fscanf(f, "%s:\n    ", buf);


    int nbMatch = 0;
    for(int j = 0; j < 17; j++)
    {
        for (int k = 0; k < 15; k++)
        {
            char num[] = {0,0,0};
            fscanf(f, "%2s:", &num);
            for (int i = 0; i < 6; i++)
            {
                if (!strcmp(num, searchSet[i]))
                {
                    nbMatch++;

                    int x = fork();

                    if (x < 0)
                        printf("error on fork\n");

                    if (x)
                    {

                        strcpy(num, replaceSet[i]);
                    }
                    break;
                }
            }
            strcat(formatedPrime, num);



            //printf("%s", num);

        }
        fscanf(f, "\n    ", buf);
        //printf("\n");
    }

    for (int k = 0; k < 2; k++)
    {
        char num[] = {0,0,0};
        fscanf(f, "%2s:", &num);
        for (int i = 0; i < 6; i++)
        {
            if (!strcmp(num, searchSet[i]))
            {
                nbMatch++;
                int x = fork();
                if (x < 0)
                    printf("error on fork\n");
                if (x)
                {
                    strcpy(num, replaceSet[i]);

                }

                break;
            }
        }
        strcat(formatedPrime, num);



        //printf("%s", num);
    }


    int pid = getpid();
    char strpid[5];
    sprintf(strpid, "%i", pid);
    strcat(outPath, strpid);

    //int out = open(outPath, O_WRONLY | O_CREAT | O_TRUNC, 00777);

    //write(out, formatedPrime, 514);

    //printf("%s\n", outPath);
    //printf("%s\n", formatedPrime);
    printf("%i\n", nbMatch);
    fclose(f);
}
