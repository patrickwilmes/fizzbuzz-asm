fizzbuzz: fizzbuzz.o
	gcc -o fizzbuzz fizzbuzz.o -no-pie
fizzbuzz.o: fizzbuzz.asm
	nasm -f elf64 -g -F dwarf fizzbuzz.asm -l fizzbuzz.lst
