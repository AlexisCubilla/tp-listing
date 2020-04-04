#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>

union semun {
int val;
struct semid_ds *buf;
unsigned short int *array;
struct seminfo *__buf;
};

// del codigo sem_all_deall.c
int binary_semaphore_allocation (key_t key, int sem_flags);
int binary_semaphore_deallocate (int semid);

//del codigo sem_init.c
int binary_semaphore_initialize (int semid);

//del codigo sem_pv.c
int binary_semaphore_wait (int semid);
int binary_semaphore_post (int semid);


//del codigo tes_sem

static void *funcion_hilo1();
static void *funcion_hilo2();