from random import uniform

from numpy import float64, uint64


def python_estimate_pi(samples: uint64) -> float64:
    c: uint64 = uint64(0)
    for _ in range(samples):
        x = uniform(-1.0, 1.0)
        y = uniform(-1.0, 1.0)
        if x * x + y * y <= 1:
            c += 1

    return 4.0 * c / float64(samples)
