# Name of the output binary
TARGET = estimate_pi

# Source files
SRC = ./main.mojo

# Build the project
build:
	mojo build -I=. $(SRC) -o $(TARGET)
	mojo format .
# Run the program
run: build
	./$(TARGET) $(samples)

.PHONY: test
# Run all tests
test:
	mojo test

# Clean up build artifacts
clean:
	rm -f $(TARGET)

