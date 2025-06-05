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
# Run mojo tests
test_mojo:
	mojo test

test_python:
	python -m unittest discover -s test -p "*.py"

test: test_mojo test_python

# Clean up build artifacts
clean:
	rm -f $(TARGET)

