from pi_estimator import estimate_pi
from random import seed
from time import monotonic as current_time
from sys import argv

fn main():
    var samples: UInt64 = 1000

    try:
        samples = Int(argv()[1])
    except e:
        print("command line must be a valid integer, defaulting to 1000")

    var result: Float64 = 0

    try:
        seed(current_time())
        result = estimate_pi(samples)
    except e:
        print("bad input", e)

    print("Estimated Pi (", samples, " samples): ", result)
