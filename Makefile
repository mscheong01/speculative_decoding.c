CC = gcc
CFLAGS = -Wall -Wextra -g
SRC = speculative_decoding.c

speculative_decoding: $(SRC)
	$(CC) $(CFLAGS) -o speculative_decoding $(SRC)

clean:
	rm -f speculative_decoding
