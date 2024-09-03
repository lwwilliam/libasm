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
BONUS = ft_list_size_bonus ft_list_push_front_bonus

OBJ_DIR = ./obj/

OBJS = $(addprefix $(OBJ_DIR), $(FILES:=.o))
B_OBJS = $(addprefix $(OBJ_DIR), $(BONUS:=.o))

all: $(NAME)

bonus: $(B_OBJS)
	ar rcs libasm.a $(B_OBJS)

$(NAME): $(OBJS)
	ar rcs libasm.a $(OBJS)

$(OBJ_DIR)%.o: %.s
	mkdir -p $(OBJ_DIR)
	nasm -f $(FORMAT) -o $@ $<

test: $(OBJS)
	gcc -o $(NAME) main.c libasm.a $(CFLAG)

compile: all bonus test

clean:
	rm -r $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) *.txt libasm.a

re: fclean all

# https://web.stanford.edu/class/cs107/resources/x86-64-reference.pdf
# https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/