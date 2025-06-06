from mojo import mojo_estimate_pi

from random import seed
from sys import argv
import benchmark

var global_samples: UInt64 = 1_000_000


fn run_mojo_benchmark() -> None:
    """Runs the function "mojo_estimate_pi" with the inputs passed from the command line.
    """
    try:
        _ = mojo_estimate_pi(global_samples)
    except e:
        print("Mojo did not run")


fn main():
    """Outputs the benchmark stats and the output of the function "mojo_estimate_pi".

    The method takes a positive integer as a command-line argument
    """
    try:
        if (len(argv())) > 1:
            global_samples = Int(argv()[1])
        else:
            global_samples = 1_000_000
    except e:
        print("issue with command line input")

    try:
        mojo_report = benchmark.run[run_mojo_benchmark]()
        mojo_report.print(benchmark.Unit.ms)
        print(
            "pi: "
            + String(mojo_estimate_pi(global_samples))
            + " samples: "
            + String(global_samples)
        )
    except e:
        print("mojo estimate did not run")
