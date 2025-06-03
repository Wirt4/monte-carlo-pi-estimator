from pi_estimator import estimate_pi
from random import seed
from time import monotonic, sleep
from sys import argv
import benchmark


@value
struct Wrapper:
    var func: fn (UInt64) raises -> Float64
    var samples: UInt64

    fn run(self) raises -> None:
        seed(monotonic())
        print("π ≈ ", self.func(self.samples), "( samples:", self.samples, ")")


fn temp():
    sleep(0.05)


fn main():
    var samples: UInt64 = 1000

    try:
        samples = Int(argv()[1])
    except e:
        print("command line must be a valid integer, defaulting to 1000")

    wrapper = Wrapper(estimate_pi, samples)

    try:
        wrapper.run()
    except e:
        print("error with wrapper", e)
        return

    try:
        report = benchmark.run[temp]()
        report.print()
    except e:
        print(e)
