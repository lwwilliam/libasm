all:
	nasm -f elf64 -o ft_strlen.o ft_strlen.asm
	nasm -f elf64 -o ft_strcpy.o ft_strcpy.asm
	nasm -f elf64 -o ft_strcmp.o ft_strcmp.asm
	nasm -f elf64 -o ft_write.o ft_write.asm

	gcc -no-pie -o a.out main.c ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o

rm:
	rm *.o
	rm a.out