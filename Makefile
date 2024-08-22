all:
	nasm -f elf64 -o ft_strlen.o ft_strlen.asm
	nasm -f elf64 -o ft_strcpy.o ft_strcpy.asm
	nasm -f elf64 -o ft_strcmp.o ft_strcmp.asm
	nasm -f elf64 -o ft_write.o ft_write.asm
	nasm -f elf64 -o ft_read.o ft_read.asm

	gcc -no-pie -o a.out main.c ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o \
		ft_read.o

rm:
	rm *.o
	rm a.out
	rm *.txt


# https://web.stanford.edu/class/cs107/resources/x86-64-reference.pdf
# https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/