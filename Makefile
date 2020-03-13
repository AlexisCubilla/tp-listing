cap1=src/capitulo_1/
bin=bin/
obj=obj/
 
all: carpetas reciprocal

reciprocal: main.o reciprocal.o
	g++ $(CFLAGS) -o $(bin)reciprocal $(obj)main.o $(obj)reciprocal.o
	
main.o: $(cap1)1.1/main.c 
	
	gcc $(CFLAGS) -c $(cap1)1.1/main.c -o $(obj)main.o -I $(cap1)1.3/ 

reciprocal.o: $(cap1)1.2/reciprocal.cpp 

	g++ $(CFLAGS) -c $(cap1)1.2/reciprocal.cpp -o $(obj)reciprocal.o -I $(cap1)1.3/
	
clean:
	rm -f $(obj)*.o $(bin)reciprocal
	rmdir bin obj

carpetas:
	mkdir bin obj
	
