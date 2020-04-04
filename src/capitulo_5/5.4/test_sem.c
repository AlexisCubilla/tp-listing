#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>

#include <pthread.h>

#include "sem.h"

int semaforo;
int contador=0;
int main()
{
    key_t key=ftok("/bin/ls",1);
    semaforo=binary_semaphore_allocation (key, IPC_CREAT | 0666);
    binary_semaphore_initialize(semaforo);
    printf("semaforo inicializado\n");
    if(semaforo==-1)
        printf("error al crear el semaforo");
    else 
    {
        pthread_t hilo1, hilo2;
        pthread_create (&hilo1,NULL,*funcion_hilo1,NULL);
        pthread_create (&hilo2,NULL,*funcion_hilo2,NULL);

        pthread_join(hilo1,NULL);
        pthread_join(hilo2,NULL);
    }
    printf("contador es igual a %d\n",contador);

    printf("\nEl programa test_sem es un ejemplo de como protejer una zona critica llamado contador\n");
    binary_semaphore_deallocate(semaforo);
    return 0;
}

static void *funcion_hilo1()
{
    for (int i=0; i<10000;i++) 
    {
        int p = binary_semaphore_wait(semaforo);
        contador++;    //protegiendo zona critica 
        //printf("Soy el hilo 1\n");
        int v = binary_semaphore_post(semaforo);//libera el semaforo 
    }
}
static void *funcion_hilo2()
{
    for (int i=0; i<10000; i++) 
    {
        int p = binary_semaphore_wait(semaforo);
        contador--; //protegiendo zona critica
        //printf("Soy el hilo 2\n");
        int v = binary_semaphore_post(semaforo);//libera el semaforo
    }
}
