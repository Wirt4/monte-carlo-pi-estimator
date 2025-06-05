import random
import sys

sys.dont_write_bytecode = True


def python_estimate_pi(samples: int) -> float:
    if samples <= 0:
        raise ValueError("Samples may not be less than or equal to 0")
    inside = 0
    for _ in range(samples):
        x = random.uniform(-1, 1)
        y = random.uniform(-1, 1)
        if x * x + y * y <= 1:
            inside += 1
    return 4.0 * inside / samples
