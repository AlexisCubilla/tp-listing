cap1=src/capitulo_1/
bin=bin/
obj=obj/
 
all: carpetas reciprocal

reciprocal: main.o reciprocal.o
	g++ $(CFLAGS) -o $(bin)capitulo_1/reciprocal $(obj)capitulo_1/main.o $(obj)capitulo_1/reciprocal.o
	
main.o: $(cap1)1.1/main.c 
	
	gcc $(CFLAGS) -c $(cap1)1.1/main.c -o $(obj)capitulo_1/main.o -I $(cap1)1.3/ 

reciprocal.o: $(cap1)1.2/reciprocal.cpp 

	g++ $(CFLAGS) -c $(cap1)1.2/reciprocal.cpp -o $(obj)capitulo_1/reciprocal.o -I $(cap1)1.3/
	
clean:
	rm -r $(obj) $(bin)

carpetas:
	mkdir -p $(bin)capitulo_1 $(bin)capitulo_2 $(bin)capitulo_3 $(bin)capitulo_4 $(bin)capitulo_5 
	mkdir -p $(obj)capitulo_1 $(obj)capitulo_2 $(obj)capitulo_3 $(obj)capitulo_4 $(obj)capitulo_5




	
