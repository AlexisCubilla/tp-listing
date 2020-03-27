
bin=bin/
obj=obj/
 
all: carpetas capitulo1 capitulo2 capitulo3

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
	rm -f libtest.a

carpetas:
	mkdir -p $(bin)capitulo_1 $(bin)capitulo_2 $(bin)capitulo_3 $(bin)capitulo_4 $(bin)capitulo_5
	mkdir -p $(obj)capitulo_1 $(obj)capitulo_2 $(obj)capitulo_3 $(obj)capitulo_4 $(obj)capitulo_5

# capitulo 2

cap2= src/capitulo_2/

capitulo2: arglist getopt_long print-env client temp_file test readfile tifftest

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

test: test.o

	ar cr libtest.a $(obj)capitulo_2/test.o 
	gcc $(CFLAGS) -c $(cap2)2.8/app.c -o $(obj)capitulo_2/app.o
	gcc -o $(bin)capitulo_2/test $(obj)capitulo_2/app.o -L. -ltest

test.o:

	gcc $(CFLAGS) -c $(cap2)2.7/test.c -o $(obj)capitulo_2/test.o

temp_file: temp_file.o creartxt

	gcc $(CFLAGS) -o $(bin)capitulo_2/temp_file $(obj)capitulo_2/temp_file.o 

temp_file.o: 

	gcc $(CFLAGS) -c $(cap2)2.5/temp_file.c -o $(obj)capitulo_2/temp_file.o

creartxt:

	cat $(cap2)2.5/texto.txt > $(bin)capitulo_2/texto.txt

	#cat > $(bin)capitulo_2/texto.txt 

readfile: readfile.o

	gcc $(CFLAGS) -o $(bin)capitulo_2/readfile $(obj)capitulo_2/readfile.o

readfile.o:

	gcc $(CFLAGS) -c $(cap2)2.6/readfile.c -o $(obj)capitulo_2/readfile.o

tifftest: tifftest.o

	gcc $(CFLAGS) -o $(bin)capitulo_2/tifftest $(obj)capitulo_2/tifftest.o -ltiff
	#@gcc -o $(C2_B)tifftest_out $(C2_S)2.9/tifftest.c -ltiff

tifftest.o:

	gcc $(CFLAGS) -c $(cap2)2.9/tifftest.c -o $(obj)capitulo_2/tifftest.o

# capitulo 3

capitulo3: print-pid system fork fork-exec

cap3=src/capitulo_3/

print-pid: print-pid.o

	gcc $(CFLAGS) -o $(bin)capitulo_3/print-pid $(obj)capitulo_3/print-pid.o

print-pid.o:

	gcc $(CFLAGS) -c $(cap3)3.1/print-pid.c -o $(obj)capitulo_3/print-pid.o

system: system.o

	gcc $(CFLAGS) -o $(bin)capitulo_3/system $(obj)capitulo_3/system.o

system.o:

	gcc $(CFLAGS) -c $(cap3)3.2/system.c -o $(obj)capitulo_3/system.o

fork: fork.o

	gcc $(CFLAGS) -o $(bin)capitulo_3/fork $(obj)capitulo_3/fork.o

fork.o:

	gcc $(CFLAGS) -c $(cap3)3.3/fork.c -o $(obj)capitulo_3/fork.o

fork-exec: fork-exec.o

	gcc $(CFLAGS) -o $(bin)capitulo_3/fork-exec $(obj)capitulo_3/fork-exec.o

fork-exec.o:

	gcc $(CFLAGS) -c $(cap3)3.4/fork-exec.c -o $(obj)capitulo_3/fork-exec.o






	
	
