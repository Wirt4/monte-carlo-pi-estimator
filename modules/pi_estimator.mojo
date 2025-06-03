from random import random_float64


fn mojo_estimate_pi(samples: UInt64) raises -> Float64:
    """
    Estimates pi based on number of samples. Samples may be any integer greater than 0.

    Lower samples means lower fidelity to pi, higher samples means highigher fidelity. This method uses the Monte Carlo method for approximating pi. Pi.estimate() can plot around 8E37 values so the upper limit is most likely how much time you want to devote your machine to processing.

    Use cases:
        low_fidelity_pi = Pi().estimate(100)
        high_fidelity_pi = Pi().estimate(1000000)
    """
    if samples == 0:
        raise ("Number of samples cannot be 0")

    circle_area = 0
    for _ in range(samples):
        if random_coordinate() ** 2 + random_coordinate() ** 2 <= 1:
            circle_area += 1

    return 4.0 * circle_area / Float64(samples)


fn random_coordinate() -> Float64:
    return random_float64(-1.0, 1.0)
