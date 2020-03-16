
bin=bin/
obj=obj/
 
all: carpetas capitulo1 capitulo2

# capitulo 1

cap1=src/capitulo_1/

capitulo1: reciprocal

reciprocal: main.o reciprocal.o
	g++ $(CFLAGS) -o $(bin)capitulo_1/reciprocal $(obj)capitulo_1/main.o $(obj)capitulo_1/reciprocal.o
	
main.o: 
	
	gcc $(CFLAGS) -c $(cap1)1.1/main.c -o $(obj)capitulo_1/main.o -I $(cap1)1.3/ 

reciprocal.o:  

	g++ $(CFLAGS) -c $(cap1)1.2/reciprocal.cpp -o $(obj)capitulo_1/reciprocal.o -I $(cap1)1.3/
	
clean:
	rm -r -f $(obj) $(bin)

carpetas:
	mkdir -p $(bin)capitulo_1 $(bin)capitulo_2 $(bin)capitulo_3 $(bin)capitulo_4 $(bin)capitulo_5
	mkdir -p $(obj)capitulo_1 $(obj)capitulo_2 $(obj)capitulo_3 $(obj)capitulo_4 $(obj)capitulo_5

# capitulo 2

cap2= src/capitulo_2/

capitulo2: arglist getopt_long print-env client temp_file

arglist: arglist.o

	gcc $(CFLAGS) -o $(bin)capitulo_2/arglist $(obj)capitulo_2/arglist.o

arglist.o: 

	gcc $(CFLAGS) -c $(cap2)2.1/arglist.c -o $(obj)capitulo_2/arglist.o 

getopt_long: getopt_long.o

	gcc $(CFLAGS) -o $(bin)capitulo_2/getopt_long $(obj)capitulo_2/getopt_long.o

getopt_long.o: 

	gcc $(CFLAGS) -c $(cap2)2.2/getopt_long.c -o $(obj)capitulo_2/getopt_long.o 

print-env: print-env.o

	gcc $(CFLAGS) -o $(bin)capitulo_2/print-env $(obj)capitulo_2/print-env.o

print-env.o: 

	gcc $(CFLAGS) -c $(cap2)2.3/print-env.c -o $(obj)capitulo_2/print-env.o 

client: client.o

	gcc $(CFLAGS) -o $(bin)capitulo_2/client $(obj)capitulo_2/client.o

client.o: 

	gcc $(CFLAGS) -c $(cap2)2.4/client.c -o $(obj)capitulo_2/client.o


#temp_file: temp_file.o

#	gcc $(CFLAGS) -o $(bin)capitulo_2/temp_file $(obj)capitulo_2/temp_file.o

#temp_file.o: 

#	gcc $(CFLAGS) -c $(cap2)2.5/temp_file.c -o $(obj)capitulo_2/temp_file.o 


	
