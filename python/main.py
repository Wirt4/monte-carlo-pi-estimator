import sys

from .benchmark import Benchmark
from .python_pi import python_estimate_pi

if __name__ == "__main__":
    samples = int(sys.argv[1]) if len(sys.argv) > 1 else 1_000_000
    report = Benchmark().run(lambda: python_estimate_pi(samples))
    report.print()
    print(f"pi: {python_estimate_pi(samples)} samples: {samples}")
