NAME = libasm

OS := $(shell uname)

ifeq ($(OS), Darwin)
    FORMAT = macho64
	CFLAG = -D__APPLE__
else
    FORMAT = elf64
	CFLAG = -no-pie -z execstack
endif

FILES = ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup

OBJ_DIR = ./obj/

OBJS = $(addprefix $(OBJ_DIR), $(FILES:=.o))

all: $(NAME)

$(NAME): $(OBJS) main.c
	ar rcs libasm.a $(OBJS)
	gcc -o $@ main.c libasm.a $(CFLAG)

$(OBJ_DIR)%.o: %.asm
	mkdir -p $(OBJ_DIR)
	nasm -f $(FORMAT) -o $@ $<

clean:
	rm -f $(NAME) *.txt libasm.a
	rm -r $(OBJ_DIR)

re: clean all

	# rm -f $(OBJS) $(NAME) *.txt
# https://web.stanford.edu/class/cs107/resources/x86-64-reference.pdf
# https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/