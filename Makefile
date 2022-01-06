CC = gcc
CFLAGS = -Wall
BUILD_DIR = build
SRC_DIR = src
TEST_DATA = test_data

all_targets = max multiply square

all: x $(all_targets)

x:
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o ./$(BUILD_DIR)/library.o $(SRC_DIR)/library.c

$(all_targets):
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o ./$(BUILD_DIR)/$(@) $(SRC_DIR)/$(@).c ./$(BUILD_DIR)/library.o

test:
	mkdir -p test
	./$(BUILD_DIR)/square inches < ./$(TEST_DATA)/square_input.txt > ./test/square_output.txt
	diff ./$(TEST_DATA)/square_expected.txt ./test/square_output.txt
	./$(BUILD_DIR)/multiply 2 < ./$(TEST_DATA)/multiply_input.txt > ./test/multiply_output.txt
	diff ./$(TEST_DATA)/multiply_expected.txt ./test/multiply_output.txt
	./$(BUILD_DIR)/max 4 3 2 1 5 7 8 10 6 > ./test/max_output.txt
	diff ./$(TEST_DATA)/max_expected.txt ./test/max_output.txt
	rm -f -r test

clean:
	rm -f -r $(BUILD_DIR)
	rm -f -r test



