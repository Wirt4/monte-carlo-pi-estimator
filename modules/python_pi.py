import numpy as np


def python_estimate_pi(samples: int) -> float:
    if samples <= 0:
        raise ValueError("Samples may not be less than or equal to 0")
    x = np.random.uniform(-1.0, 1.0, samples)
    y = np.random.uniform(-1.0, 1.0, samples)
    inside_circle = (x**2 + y**2) <= 1.0
    return float(4.0 * np.sum(inside_circle) / samples)
