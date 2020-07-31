BIN = /usr/bin
GCC_BIN = $(BIN)/gcc
GCC_UNIVERSAL = $(GCC_BASE)

CFLAGS = 
GCC_BASE = $(GCC_BIN) -Os $(CFLAGS) -Wimplicit -I ./includes/

all: xpwntool

xpwntool: xpwntool.o img3.o img2.o abstractfile.o nor_files.o libxpwn.o lzssfile.o lzss.o
	libtool -static abstractfile.o img2.o img3.o libxpwn.o lzss.o lzssfile.o nor_files.o xpwntool.o -o libxpwntool.a

%.o: %.c
	$(GCC_UNIVERSAL) -c -o $@ $< 

clean:
	rm -f *.o xpwntool
