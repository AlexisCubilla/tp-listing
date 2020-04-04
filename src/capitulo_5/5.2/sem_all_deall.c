#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/types.h>
#include "sem.h"
/* We must define union semun ourselves.*/

    // redefinifo en el encabezado .h creado en el la carpeta 5.4

/* Obtain a binary semaphore’s ID, allocating if necessary.*/

int binary_semaphore_allocation (key_t key, int sem_flags)
{
return semget (key, 1, sem_flags);
}

/* Deallocate a binary semaphore. All users must have finished their
use. Returns -1 on failure. */

int binary_semaphore_deallocate (int semid)
{
union semun ignored_argument;
return semctl (semid, 1, IPC_RMID, ignored_argument);
}
