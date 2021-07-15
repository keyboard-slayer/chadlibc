CC		?= gcc
LD		= ld
AR		= ar
RM		= rm -f

CFLAGS	+= -Wall -Werror -Wextra -fpic -fno-builtin -nostdlib \
			 -nostdinc -Iinclude
ifneq ($(CC), tcc)
CFLAGS	+= -ansi -pedantic
endif
LDFLAGS	+= -nostdlib -shared
ARFLAGS	= rcs

STRING_SRC	= memcpy.c strcpy.c strncpy.c
SRCS	= ctype.c \
			$(addprefix string/, $(STRING_SRC))
OBJS	= $(addprefix src/, $(SRCS:.c=.o))

TARGET	= libc

all: $(TARGET).a $(TARGET).so

$(TARGET).a: $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(TARGET).so: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	$(RM) $(OBJS) $(TARGET).a $(TARGET.o)

re: clean all

.PHONY: all clean re
