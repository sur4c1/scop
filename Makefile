# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yyyyyy <yyyyyy@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/15 16:05:50 by bguyot            #+#    #+#              #
#    Updated: 2024/09/23 12:37:49 by yyyyyy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	scop

INC_FILE	=	scop displayer Parser.class
SRC_FILE	=	scop displayer Parser.class bmp_parser

INCS 		=	$(addprefix incs/, $(addsuffix .hpp, $(INC_FILE)))
SRCS 		=	$(addprefix srcs/, $(addsuffix .cpp, $(SRC_FILE)))
OBJS		=	$(SRCS:.cpp=.o)
LIBS		=	-lglfw -lGLU -lGL -lXrandr -lXxf86vm -lXi -lXinerama -lX11 -lrt -ldl -lGLEW -lGL

CC			=	c++
FLAGS		=	-I incs

all: $(NAME)

$(NAME): $(OBJS) $(INCS) $(LIBS)
	$(CC) $(FLAGS) $(DEBUG_FLAGS) $(OBJS) -o $(NAME) $(LIBS)

.cpp.o:
	$(CC) -c $(FLAGS) $(DEBUG_FLAGS) -o $@ $<

re: fclean all

fclean: clean
	rm -rf $(NAME)

clean:
	rm -rf $(OBJS)

.PHONY: all re fclean clean .cpp.o
