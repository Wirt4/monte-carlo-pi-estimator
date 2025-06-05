from modules import mojo_estimate_pi
from random import seed
from sys import argv
import benchmark
from python import Python

var global_samples: UInt64 = 1000


fn run_mojo_benchmark() -> None:
    try:
        _ = mojo_estimate_pi(global_samples)
    except e:
        print("Mojo did not run")


fn run_python_benchmark() -> None:
    try:
        pi = Python.import_module("modules.python_pi")
        pi.python_estimate_pi(global_samples)
    except e:
        print("Python did not run")


fn main():
    try:
        global_samples = Int(argv()[1])
    except e:
        print("defaulting to 1000")

    try:
        print(
            "Mojo",
            "π ≈ ",
            mojo_estimate_pi(global_samples),
            "(samples:",
            global_samples,
            ")",
        )

        print("benchmarking mojo...")
        mojo_report = benchmark.run[run_mojo_benchmark]()
        mojo_report.print()
    except e:
        print("mojo estimate did not run")

    try:
        pi = Python.import_module("modules.python_pi")
        print(
            "Python",
            "π ≈ ",
            pi.python_estimate_pi(global_samples),
            "(samples:",
            global_samples,
            ")",
        )

        print("benchmarking python...")
        python_report = benchmark.run[run_python_benchmark]()
        python_report.print()
    except e:
        print("python estimate did not run")
