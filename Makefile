NAME = RT

SRCS = RT.cpp
DIR_SRCS = srcs

UNAME := $(shell uname)

SCENE_SRCS = Scene.cpp Test.cpp
SCENE_INCLUDES = Scene.hpp
SCENE_SRCS_DIR = Scene
SCENE_SRCS_PATH = $(addprefix $(SCENE_SRCS_DIR)/, $(SCENE_SRCS))
SRCS += $(SCENE_SRCS_PATH)
DIRS = $(SCENE_SRCS_DIR)

SRCS_PATH = $(addprefix $(DIR_SRCS)/, $(SRCS))

INCLUDES = RT.hpp
DIR_INCLUDES = includes
INCLUDES_PATH = $(addprefix $(DIR_INCLUDES)/, $(INCLUDES))

DIR_OBJS = objs
OBJS = $(patsubst %.cpp, %.o, $(SRCS))
PATH_OBJS = $(addprefix $(DIR_OBJS)/, $(OBJS))
DIR_SRCS_OBJS = $(addprefix $(DIR_OBJS)/, $(DIRS))

GLFW_LIB = glfw/lib-universal/libglfw3.a
GLFW_HEADERS_DIR = glfw/include

GLAD_LIB = glad/glad.a
GLAD_HEADERS_DIR = glad/include

GLEW_lIB = glew/2.2.0_1/lib/libGLEW.dylib
GLEW_HEADERS_DIR = glew/2.2.0_1/include
GLM_HEADERS_DIR = glm/glm

CC = clang++

FLAGS = -g -O3 -std=c++17 -Wall -Werror -Wextra
ifeq ($(UNAME),Darwin)  # Mac OS X
	GLFLAGS = -Lglfw/lib -lglfw3 -Lglew/2.2.0_1/lib -lGLEW -framework OpenGL -framework Cocoa -framework IOKit -framework Carbon -framework CoreVideo
endif
ifeq ($(UNAME),Linux) # Linux
	GLFLAGS = -lglfw -lGLEW -lGLU -lGL -lXrandr -lXxf86vm -lX11 -lrt -ldl
endif

RM = rm -rf

GREEN = \033[0;32m
RESET = \033[0m

all: $(NAME)

$(NAME): write_logo create_dirs $(PATH_OBJS)
	@echo "$(GREEN)\nObjects was created $(RESET)"
	@$(CC) $(FLAGS) $(PATH_OBJS) $(GLFLAGS) -I $(DIR_INCLUDES) -I $(GLFW_HEADERS_DIR) -I $(GLAD_HEADERS_DIR) -I $(GLEW_HEADERS_DIR) -I $(GLM_HEADERS_DIR) -I $(GLM_HEADERS_DIR) -o $@
	@echo "$(GREEN)Simply the best hard multi-d ray-tracing mother lover by peace dukes was compiled $(RESET)"

write_logo:
	@echo "$(GREEN)\n\
	░██████╗██╗███╗░░░███╗██████╗░██╗░░░░░██╗░░░██╗  ████████╗██╗░░██╗███████╗  ██████╗░███████╗░██████╗████████╗\n\
	██╔════╝██║████╗░████║██╔══██╗██║░░░░░╚██╗░██╔╝  ╚══██╔══╝██║░░██║██╔════╝  ██╔══██╗██╔════╝██╔════╝╚══██╔══╝\n\
	╚█████╗░██║██╔████╔██║██████╔╝██║░░░░░░╚████╔╝░  ░░░██║░░░███████║█████╗░░  ██████╦╝█████╗░░╚█████╗░░░░██║░░░\n\
	░╚═══██╗██║██║╚██╔╝██║██╔═══╝░██║░░░░░░░╚██╔╝░░  ░░░██║░░░██╔══██║██╔══╝░░  ██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░\n\
	██████╔╝██║██║░╚═╝░██║██║░░░░░███████╗░░░██║░░░  ░░░██║░░░██║░░██║███████╗  ██████╦╝███████╗██████╔╝░░░██║░░░\n\
	╚═════╝░╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝░░░╚═╝░░░  ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ╚═════╝░╚══════╝╚═════╝░░░░╚═╝░░░\n\
\n\
	██╗░░██╗░█████╗░██████╗░██████╗░  ███╗░░░███╗██╗░░░██╗██╗░░░░░████████╗██╗░░░░░░██████╗░\n\
	██║░░██║██╔══██╗██╔══██╗██╔══██╗  ████╗░████║██║░░░██║██║░░░░░╚══██╔══╝██║░░░░░░██╔══██╗\n\
	███████║███████║██████╔╝██║░░██║  ██╔████╔██║██║░░░██║██║░░░░░░░░██║░░░██║█████╗██║░░██║\n\
	██╔══██║██╔══██║██╔══██╗██║░░██║  ██║╚██╔╝██║██║░░░██║██║░░░░░░░░██║░░░██║╚════╝██║░░██║\n\
	██║░░██║██║░░██║██║░░██║██████╔╝  ██║░╚═╝░██║╚██████╔╝███████╗░░░██║░░░██║░░░░░░██████╔╝\n\
	╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░  ╚═╝░░░░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░░░░╚═════╝░\n\
\n\
	██████╗░░█████╗░██╗░░░██╗░░░░░░████████╗██████╗░░█████╗░░█████╗░██╗███╗░░██╗░██████╗░\n\
	██╔══██╗██╔══██╗╚██╗░██╔╝░░░░░░╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║████╗░██║██╔════╝░\n\
	██████╔╝███████║░╚████╔╝░█████╗░░░██║░░░██████╔╝███████║██║░░╚═╝██║██╔██╗██║██║░░██╗░\n\
	██╔══██╗██╔══██║░░╚██╔╝░░╚════╝░░░██║░░░██╔══██╗██╔══██║██║░░██╗██║██║╚████║██║░░╚██╗\n\
	██║░░██║██║░░██║░░░██║░░░░░░░░░░░░██║░░░██║░░██║██║░░██║╚█████╔╝██║██║░╚███║╚██████╔╝\n\
	╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░░░░░░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝╚═╝░░╚══╝░╚═════╝░\n\
\n\
	███╗░░░███╗░█████╗░████████╗██╗░░██╗███████╗██████╗░  ██╗░░░░░░█████╗░██╗░░░██╗███████╗██████╗░  ██████╗░██╗░░░██╗\n\
	████╗░████║██╔══██╗╚══██╔══╝██║░░██║██╔════╝██╔══██╗  ██║░░░░░██╔══██╗██║░░░██║██╔════╝██╔══██╗  ██╔══██╗╚██╗░██╔╝\n\
	██╔████╔██║██║░░██║░░░██║░░░███████║█████╗░░██████╔╝  ██║░░░░░██║░░██║╚██╗░██╔╝█████╗░░██████╔╝  ██████╦╝░╚████╔╝░\n\
	██║╚██╔╝██║██║░░██║░░░██║░░░██╔══██║██╔══╝░░██╔══██╗  ██║░░░░░██║░░██║░╚████╔╝░██╔══╝░░██╔══██╗  ██╔══██╗░░╚██╔╝░░\n\
	██║░╚═╝░██║╚█████╔╝░░░██║░░░██║░░██║███████╗██║░░██║  ███████╗╚█████╔╝░░╚██╔╝░░███████╗██║░░██║  ██████╦╝░░░██║░░░\n\
	╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝  ╚══════╝░╚════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝  ╚═════╝░░░░╚═╝░░░\n\
\n\
	██████╗░███████╗░█████╗░░█████╗░███████╗  ██████╗░██╗░░░██╗██╗░░██╗███████╗░██████╗\n\
	██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██║░░░██║██║░██╔╝██╔════╝██╔════╝\n\
	██████╔╝█████╗░░███████║██║░░╚═╝█████╗░░  ██║░░██║██║░░░██║█████═╝░█████╗░░╚█████╗░\n\
	██╔═══╝░██╔══╝░░██╔══██║██║░░██╗██╔══╝░░  ██║░░██║██║░░░██║██╔═██╗░██╔══╝░░░╚═══██╗\n\
	██║░░░░░███████╗██║░░██║╚█████╔╝███████╗  ██████╔╝╚██████╔╝██║░╚██╗███████╗██████╔╝\n\
	╚═╝░░░░░╚══════╝╚═╝░░╚═╝░╚════╝░╚══════╝  ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░\n\
		$(RESET)"

create_dirs:
	@mkdir -p $(DIR_OBJS) $(DIR_SRCS_OBJS)

$(DIR_OBJS)/%.o: $(DIR_SRCS)/%.cpp $(INCLUDES_PATH) Makefile
	@$(CC) $(FLAGS) -I $(DIR_INCLUDES) -I $(GLFW_HEADERS_DIR) -I $(GLAD_HEADERS_DIR) -I $(GLEW_HEADERS_DIR) -I $(GLM_HEADERS_DIR) -c $< -o $@
	@echo "$(GREEN).$(RESET)\c"

clean:
	@$(RM) $(DIR_OBJS)
	@echo "$(GREEN) clean instruction was executed $(RESET)"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(GREEN) fclean instruction was executed $(RESET)"

re: fclean all

.PHONY: all clean fclean re write_logo create_dirs
