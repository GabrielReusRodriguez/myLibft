# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gabriel <gabriel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/04 01:34:53 by greus-ro          #+#    #+#              #
#    Updated: 2024/07/01 21:40:14 by gabriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


BIN_DIR	=./bin
SRC_DIR	=./src
INC_DIR	=./inc

NAME	=libft.a
CFLAGS	=-Wall -Wextra -Werror -MMD -MP

ifdef CSANITIZE
	SANITIZE_FLAGS = -fsanitize=${CSANITIZE}
endif 

CFLAGS += ${SANITIZE_FLAGS}

LIBFT_SRC_FILES=	ft_atoi.c			\
					ft_atol.c			\
					ft_bzero.c			\
					ft_calloc.c			\
					ft_dtoh.c			\
					ft_iputchar_fd.c	\
					ft_iputendl_fd.c	\
					ft_iputnbr_fd.c		\
					ft_iputstr_fd.c		\
					ft_isalnum.c		\
					ft_isalpha.c		\
					ft_isascii.c		\
					ft_isdigit.c		\
					ft_islower.c		\
					ft_isupper.c		\
					ft_isprint.c		\
					ft_itoa.c			\
					ft_memchr.c			\
					ft_memcmp.c			\
					ft_memcpy.c			\
					ft_memmove.c		\
					ft_memset.c			\
					ft_putchar_fd.c		\
					ft_putendl_fd.c		\
					ft_putnbr_fd.c		\
					ft_putstr_fd.c		\
					ft_sfree.c			\
					ft_split.c			\
					ft_strchr.c			\
					ft_strdup.c			\
					ft_striteri.c		\
					ft_strjoin.c		\
					ft_strlcat.c		\
					ft_strlcpy.c		\
					ft_strlen.c			\
					ft_strmapi.c		\
					ft_strncmp.c		\
					ft_strcmp.c			\
					ft_strnstr.c		\
					ft_strrchr.c		\
					ft_istrchr.c 		\
					ft_strtrim.c		\
					ft_substr.c			\
					ft_tolower.c		\
					ft_toupper.c		\
					ft_utoa.c

BONUS_SRC_FILES=	ft_lstadd_front_bonus.c	\
					ft_lstadd_back_bonus.c	\
					ft_lstclear_bonus.c		\
					ft_lstdelone_bonus.c	\
					ft_lstiter_bonus.c		\
					ft_lstlast_bonus.c		\
					ft_lstmap_bonus.c		\
					ft_lstnew_bonus.c		\
					ft_lstsize_bonus.c		


BONUS_OBJ_FILES=$(BONUS_SRC_FILES:%.c=${BIN_DIR}/%.o)
BONUS_DEP_FILES=$(BONUS_SRC_FILES:%.c=${BIN_DIR}/%.d)

LIBFT_OBJ_FILES=$(LIBFT_SRC_FILES:%.c=${BIN_DIR}/%.o)
LIBFT_DEP_FILES=$(LIBFT_SRC_FILES:%.c=${BIN_DIR}/%.d)

all:${NAME}

-include ${LIBFT_DEP_FILES}
-include ${BONUS_DEP_FILES}

${NAME}: ${LIBFT_OBJ_FILES} ${BONUS_OBJ_FILES} ${BIN_DIR}
	ar -rcs ${NAME} ${LIBFT_OBJ_FILES}

${BIN_DIR}:
	mkdir -p ${BIN_DIR}
	
${BIN_DIR}/%.o:${SRC_DIR}/%.c  Makefile
	cc ${CFLAGS}  -c $< -I ${INC_DIR}  -o $@ 

clean:
	rm -f ${BIN_DIR}/*.o
	rm -f ${BIN_DIR}/*.d

fclean: clean 
	rm -f ${NAME}
	
re: fclean all

#bonus:${BONUS_OBJ_FILES} ${LIBFT_OBJ_FILES}
#	ar -rcs ${NAME} ${LIBFT_OBJ_FILES} ${BONUS_OBJ_FILES}
#	@touch bonus

norm:
	@norminette | grep Error || true

.PHONY= all clean fclean re norm
