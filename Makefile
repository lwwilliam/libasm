nasm -f elf64 -o ft_strlen.o ft_strlen.asm
nasm -f elf64 -o ft_strcpy.o ft_strcpy.asm
nasm -f elf64 -o ft_strcmp.o ft_strcmp.asm
gcc -no-pie -o a.out main.c ft_strlen.o ft_strcpy.o ft_strcmp.o