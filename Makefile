# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acaceres <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/01 07:08:03 by acaceres          #+#    #+#              #
#    Updated: 2023/04/01 07:08:05 by acaceres         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### DEFINE MAIN FILES ###
SRCS = ft_memset.c					\
		ft_bzero.c					\
		ft_memcpy.c					\
		ft_memmove.c 				\
		ft_strlen.c					\
		ft_isalpha.c 				\
		ft_isdigit.c				\
		ft_isalnum.c				\
		ft_isascii.c				\
		ft_isprint.c				\
		ft_memset.c					\
		ft_strlcpy.c				\
		ft_strlcat.c				\
		ft_toupper.c				\
		ft_tolower.c				\
		ft_strchr.c					\
		ft_strrchr.c				\
		ft_strncmp.c				\
		ft_memchr.c					\
		ft_memcmp.c					\
		ft_strnstr.c				\
		ft_atoi.c					\
		ft_calloc.c					\
		ft_strdup.c					\
		ft_substr.c					\
		ft_strjoin.c				\
		ft_strtrim.c				\
		ft_split.c					\
		ft_itoa.c					\
		ft_strmapi.c				\
		ft_striteri.c				\
		ft_putchar_fd.c				\
		ft_putstr_fd.c				\
		ft_putendl_fd.c				\
		ft_putnbr_fd.c

### DEFINE BONUS FILES ###
SRCSB =	ft_lstnew_bonus.c			\
		ft_lstadd_front_bonus.c		\
		ft_lstnew_bonus.c			\
		ft_lstsize_bonus.c			\
		ft_lstlast_bonus.c			\
		ft_lstadd_back_bonus.c		\
		ft_lstdelone_bonus.c		\
		ft_lstclear_bonus.c			\
		ft_lstiter_bonus.c			\
		ft_lstmap_bonus.c			\
		$(SRCS)

### COLORS ###
COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m


### OBJS FOLDER ###
OBJS_DIR = objs/

## MAIN ###
OBJS			=	$(SRCS:.c=.o)
OBJS_TO_FOLDER	= 	$(addprefix $(OBJS_DIR), $(OBJS))

### BONUS ###
OBJSB			= 	$(SRCSB:.c=.o)
OBJSB_TO_FOLDER =	$(addprefix $(OBJS_DIR), $(OBJSB))

### COMPILED OUTPUT ###
NAME	=	libft.a

### COMPILE COMMANDS AND FLAGS ###
CC		=	cc
FLAGS	=	-Wall -Wextra -Werror
RM		=	rm -f

### CREATE FOLDER & COMPILE .o ###
$(OBJS_DIR)%.o: %.c	libft.h
	@mkdir -p $(OBJS_DIR)
	@$(CC) $(FLAGS) -c $< -o $@
	@echo "$(COLOUR_BLUE)Compiling: $(COLOUR_END)$(COLOUR_GREEN)$<$(COLOUR_END)"

### REMOVE COMMANDS ###
RM = rm	-rf

### COMPILE LIBRARY ###
$(NAME): $(OBJS_TO_FOLDER)
	@ar rcs $(NAME) $(OBJS_TO_FOLDER)
	@echo "$(COLOUR_GREEN)libft done!$(COLOUR_END)"

### DEFINE MAKE ALL ###
all: $(NAME)

### MAKE CLEAN ###
clean:
	@$(RM) $(OBJS_DIR)
	@echo "$(COLOUR_BLUE)$(OBJS_DIR)$(COLOUR_END) $(COLOUR_GREEN)cleaned!$(COLOUR_END)"

### MAKE FCLEAN ###
fclean:	clean
	@$(RM) $(NAME)

### RELINK ###
re: fclean all

### COMPLiE BONUS ###
bonus: $(OBJSB_TO_FOLDER)
	@ar rcs $(NAME) $(OBJSB_TO_FOLDER)
	@echo "$(COLOUR_GREEN)libft bonus done!$(COLOUR_END)"

### PHONY'S ###
.PHONY: all clean fclean re bonus
