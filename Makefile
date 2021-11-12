CC= gcc
THREAD=-lpthread
CFLAGS= -Wall -pedantic
OBJECTSS= ./built/server.o ./built/file.o ./built/hash.o ./built/list.o ./built/queue.o
OBJECTSC= ./built/client.o ./built/api.o ./built/stringutil.o
SERVEROUT= ./out/server
CLIENTOUT= ./out/client
SOURCES= ./source/server.c ./source/file.c ./source/hash.c ./source/list.c ./source/queue.c
SOURCEC= ./source/client.c ./source/api.c  ./source/stringutil.c
server: ./source/server.c
	$(CC) -I./header/*.h -o $(SERVEROUT) $(SOURCES)  $(CFLAGS) $(THREAD)

client:
	$(CC) -I./header/*.h -o $(CLIENTOUT) $(SOURCEC)  $(CFLAGS) $(THREAD)

all: server client

test1: server client
	./Test/test1.sh
test2:  server client
	./Test/test2.sh
test3: server client
	./Test/test3.sh
clean:

cleanall:
	@rm -f $(SERVEROUT) $(CLIENTOUT) 