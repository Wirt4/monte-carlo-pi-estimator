from pi_estimator import estimate_pi
from random import seed
from time import monotonic as current_time
from sys import argv


# another test
fn main():
    nput = argv()[1]
    print("you entered", nput)
    var samples: Int = 1_000_000
    var result: Float64 = 0
    try:
        seed(current_time())
        result = estimate_pi(samples)
    except e:
        print("bad input", e)
    print("Estimated Pi (", samples, " samples): ", result)
