#include <signal.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>


sig_atomic_t child_exit_status;

void clean_up_child_process (int signal_number)
{
    /* Clean up the child process.  */
    int status;
    wait (&status);
    /* Store its exit status in a global variable.  */
    child_exit_status = status;
}

int main ()
{
    /* Handle SIGCHLD by calling clean_up_child_process.  */
    struct sigaction sigchld_action;
    memset (&sigchld_action, 0, sizeof (sigchld_action));
    sigchld_action.sa_handler = &clean_up_child_process;
    sigaction (SIGCHLD, &sigchld_action, NULL);
    /* codigo agregado */


    pid_t idHijo;
	pid_t idPropio;

    idPropio = getpid(); //Se obtiene el id del proceso actual
	idHijo = fork(); //Se crea un proceso 'hijo'

    if (idHijo == 0) //la ejecución de la llamada al sistema fork devuelve un cero al proceso 'hijo'
    {
		printf("Soy el hijo con id %d del id proceso original %d\n",(int)getpid(),(int)idPropio);
        pid_t idPropio2=getpid(); 
        pid_t idHijo2=fork(); 

        if(idHijo2==0)
        {
            printf("Soy el hijo con id %d del id proceso %d\n", (int)getpid(), (int)idPropio2);
        }
        else
        {
            printf("Soy el padre con id %d del id proceso %d\n", (int)getpid(), (int)idHijo2);
            kill(idPropio2,SIGCHLD); 

        }
        
    }
    else //la ejecución de la llamada al sistema fork devuelve el identificador al proceso 'padre'
    {
		printf("Soy el padre original con id %d del id proceso %d\n", (int)getpid(), (int)idHijo);
        kill(idPropio,SIGCHLD);  
    }

    return 0;
}