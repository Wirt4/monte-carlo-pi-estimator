from modules import mojo_estimate_pi
from random import seed
from sys import argv
import benchmark

var global_samples: UInt64 = 1_000_000


fn run_mojo_benchmark() -> None:
    try:
        _ = mojo_estimate_pi(global_samples)
    except e:
        print("Mojo did not run")


fn main():
    try:
        global_samples = Int(argv()[1])
    except e:
        print("defaulting to 1000000")

    try:
        mojo_report = benchmark.run[run_mojo_benchmark]()
        mojo_report.print(benchmark.Unit.ms)
    except e:
        print("mojo estimate did not run")
