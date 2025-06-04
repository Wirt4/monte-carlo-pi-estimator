from modules import mojo_estimate_pi
from random import seed
from time import monotonic, sleep
from sys import argv
import benchmark
from python import Python, PythonModule, PythonObject


fn python_adapter(n: UInt64) raises -> Float64:
    py = Python.import_module("modules.python_pi")
    return Float64(py.python_estimate_pi(n))


@value
struct Wrapper:
    var delegate_fn: fn (UInt64) raises -> Float64
    var samples: UInt64
    var label: String

    fn run(self) raises -> None:
        seed(monotonic())
        var result = self.delegate_fn(self.samples)
        print(self.label, ": π ≈ ", result, "(samples:", self.samples, ")")


fn main():
    var samples: UInt64 = 1000

    try:
        samples = Int(argv()[1])
    except e:
        print("command line must be a valid integer, defaulting to 1000")

    mojo_wrapper = Wrapper(mojo_estimate_pi, samples, "Mojo")
    python_wrapper = Wrapper(python_adapter, samples, "Python")

    try:
        mojo_wrapper.run()
    except e:
        print("error with mojo wrapper", e)
        return

    try:
        python_wrapper.run()
    except e:
        print("error with python wrapper", e)
