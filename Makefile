dir1=src/capitulo_1/
bin=bin/
obj=obj/

all: carpetas reciprocal

reciprocal: main.o reciprocal.o
	g++ $(CFLAGS) -o $(bin)reciprocal $(obj)main.o $(obj)reciprocal.o
	
main.o: $(dir1)main.c $(dir1)reciprocal.hpp
	gcc $(CFLAGS) -c -o $(obj)main.o $(dir1)main.c

reciprocal.o: $(dir1)reciprocal.cpp $(dir1)reciprocal.hpp
	g++ $(CFLAGS) -c -o $(obj)reciprocal.o $(dir1)reciprocal.cpp
	
clean:
	rm -f $(obj)*.o $(bin)reciprocal
	rmdir bin obj

carpetas:
	mkdir bin obj