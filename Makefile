NASMFLAGS ?= -felf64
SOURCES   ?= hello_as.asm


build: a.out

a.out: hello_as.o
	ld hello_as.o

hello_as.o: $(SOURCES)
	nasm -felf64 $(SOURCES)

run: build
	./a.out

clean:
	rm -rf hello_as.o
	rm -rf a.out


