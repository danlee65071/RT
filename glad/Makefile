NAME = glad.a

SRCS = src/glad.c

HEADERS_DIRS = include/

OBJS = $(patsubst %.c, %.o, $(SRCS))

CC = clang

RM = rm -f

%.o: %.c
	gcc -c $< -I $(HEADERS_DIRS) -o $@

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
