from random import random_float64

struct Pi():
    fn estimate(self, n: Int) -> Float64:
    """
    Returns an approximation of pi based on the number of samples in n.

    The function depends on the built-in `random` module supplied by mojo.
    You can input up to about 10E37 samples without repeating a point, so 
    the only practical limitation on accuracy is how much runtime you want to devote to the function.

    Use examples;
	low_fidelity_pi = Pi().estimate(100)
	high_fidelity_pi = Pi().estimate(100000000)
    """
    c = 0
    for _ in range(n):
        x = random_float64(-1.0, 1.0)
        y = random_float64(-1.0, 1.0)
        if x*x + y*y <= 1:
            c +=1
    return 4 * c / n
