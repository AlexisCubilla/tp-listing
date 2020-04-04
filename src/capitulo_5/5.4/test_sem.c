#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include "sem.h"


int imprimir_en_pantalla(int semaforo)
{
    pid_t pid; 
    /*Creamos un proceso hijo que imprime en pantalla*/
    pid = fork();

    if(pid==0)
    {
        /* el proceso hijo adquiere el semaforo y con ello el recurso (pantalla)*/
        sleep(1);
        int p = binary_semaphore_wait(semaforo);
        printf("Soy el hijo\n");
        int v = binary_semaphore_post(semaforo);//libera el semaforo
    }
    else
    {
        /* el proceso padre adquiere el semaforo y con ello el recurso(pantalla)*/
        sleep(2);
        int p = binary_semaphore_wait(semaforo);
        printf("Soy el padre\n");
        int v = binary_semaphore_post(semaforo);//libera el semaforo   
    }
    return 1;
}
int main()
{
    key_t key=ftok("/bin/ls",1);
    int semaforo=binary_semaphore_allocation (key, IPC_CREAT | 0666);
    binary_semaphore_initialize(semaforo);
    printf("inicializado\n");
    if(semaforo==-1)
        printf("error al crear el semaforo");
    else 
    {
        for(int i=0;i<2;i++)

            imprimir_en_pantalla(semaforo);
    }
    binary_semaphore_deallocate(semaforo);
    return 0;
}


