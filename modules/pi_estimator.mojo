from random import random_float64

@value
struct Pi():
    @staticmethod
    fn estimate_pi(n: UInt64) raises -> Float64:
        """
        Estimates pi based on number of samples.

        Lower samples means lower fidelity to pi, higher samples means highigher fidelity. This method uses the Monte Carlo method for approximating pi. Pi.estimate() can plot around 8E37 values so the upper limit is most likely how much time you want to devote your machine to processing.

        Use cases:
            low_fidelity_pi = Pi().estimate(100)
            high_fidelity_pi = Pi().estimate(1000000)
        """
        if n == 0:
            raise("N cannot be 0")
        c = 0
        for _ in range(n):
            x = random_float64(-1.0, 1.0)
            y = random_float64(-1.0, 1.0)
            if x*x + y*y <= 1:
                c +=1
        return 4 * c / Float64(n)
