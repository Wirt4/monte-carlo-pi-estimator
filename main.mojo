from modules.pi_estimator import Pi
from random import seed
from time import monotonic as current_time

fn main():
    var samples: Int = 10_000
    var result: Float64 = 0
    try:
        seed(current_time())
        result = Pi.estimate_pi(samples)
    except e:
        print("bad input", e)
    print("Estimated Pi (", samples, " samples): ", result)
