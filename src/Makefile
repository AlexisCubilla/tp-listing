
reciprocal: capitulo_1/main.o capitulo_1/reciprocal.o
	g++ $(CFLAGS) -o reciprocal capitulo_1/main.o capitulo_1/reciprocal.o
	
main.o: capitulo_1/main.c capitulo_1/reciprocal.hpp
	gcc $(CFLAGS) -c capitulo_1/main.c

reciprocal.o: capitulo_1/reciprocal.cpp capitulo_1/reciprocal.hpp
	g++ $(CFLAGS) -c capitulo_1/reciprocal.cpp
	
clean:
	rm -f capitulo_1/*.o reciprocal
