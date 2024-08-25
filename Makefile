OS := $(shell uname)

ifeq ($(OS), Darwin)
    FORMAT = macho64
else
    FORMAT = elf64
endif

FILES = ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup
OBJS = $(FILES:=.o)

all: a.out

a.out: $(OBJS) main.c
	gcc -o $@ main.c $(OBJS)

%.o: %.asm
	nasm -f $(FORMAT) -o $@ $<

clean:
	rm -f *.o a.out *.txt
	# rm -f $(OBJS) a.out *.txt

re: clean all

# https://web.stanford.edu/class/cs107/resources/x86-64-reference.pdf
# https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/