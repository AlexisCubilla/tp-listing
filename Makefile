dir1=src/capitulo_1/
reciprocal: $(dir1)main.o $(dir1)reciprocal.o
	g++ $(CFLAGS) -o reciprocal $(dir1)main.o $(dir1)reciprocal.o
	
main.o: $(dir1)main.c $(dir1)reciprocal.hpp
	gcc $(CFLAGS) -c $(dir1)main.c

reciprocal.o: $(dir1)reciprocal.cpp $(dir1)reciprocal.hpp
	g++ $(CFLAGS) -c $(dir1)reciprocal.cpp
	
clean:
	rm -f $(dir1)*.o reciprocal