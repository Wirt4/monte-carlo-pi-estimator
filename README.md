# Monte Carlo π Estimator in Mojo

This project implements a Monte Carlo method to estimate the value of π using [Mojo](https://www.modular.com/mojo), a new programming language that combines Pythonic usability with systems-level performance. The goal is to explore Mojo's capabilities and its potential in AI and performance-critical applications.

## Features

- Command-line interface for user interaction
- Random point generation within a unit square
- Calculation of π based on the ratio of points inside the unit circle
- Basic testing using Mojo's available

## Getting Started
Since Mojo currently has limited platform support, we're containerized in Docker. Check that docker is running. Build the project with `docker compose build`. Start the environment with `docker compose run --rm app`.

Mojo commands are encapsulated with a Makefile. Run `make` to build the project. Run `make run samples=${number of samples}` to run it, or you can run `./estimate_pi ${number of samples}` against the compiled executable. Run `make test` to run all unit tests and `make clean` to remove the executable.

Shutting down is an easy enough process. Run `exit` to get out of the virtual environment, then `docker compose down` to shut down any remaining containers.

## Tests
run `mojo test` to run all mojo tests.
run `python -m unittest discover -s test -p "*.py"` to run all python tests.
## Linting
From root directory: `mojo format .`

## Prequisites
  - `Docker` and `Docker Desktop`

## Challenges

Mojo is an emerging language, and as of May 2025, it presents unique challenges:
  - Limited community support and documentation
  - Evolving tooling and ecosystem
  - Lack of official Docker images

These challenges offer an opportunity to find solutions from the bolts-up and contribute to the Mojo ecosystem.

## License
 
The MIT License (MIT)

Copyright (c) 2025 Wirt Salthouse

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
