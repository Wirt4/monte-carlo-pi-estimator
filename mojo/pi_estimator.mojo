from random import rand
from memory import UnsafePointer
from buffer import NDBuffer

alias type = DType.float32
alias point = UnsafePointer[Scalar[type]]
alias buffer = NDBuffer[type, 1]


@value
struct RandomizedCoorindates:
    fn __init__(self, size: Int):
        self._x_ptr = point.alloc(size)
        self._y_ptr = point.alloc(size)

        self._fill(self._x_ptr)
        self._fill(self._y_ptr)

        self._x_buffer = buffer(self._x_ptr, size)
        self._y_buffer = buffer(self._y_ptr, size)

    fn get_euclidian_distance_squared(self, ndx: Int) -> Float32:
        x = self._x_buffer[ndx]
        y = self._y_buffer[ndx]
        return x * x + y * y

    fn clear(self):
        self._x_ptr.free()
        self._y_ptr.free()

    fn _fill(self, pointer: UnsafePointer):
        rand[type](y_ptr, samples, min=-1.0, max=1.0)


fn mojo_estimate_pi(samples: Int) raises -> Float32:
    """
    Estimates pi based on number of samples. Samples may be any integer greater than 0.

    Lower samples means lower fidelity to pi, higher samples means higher fidelity. This method uses the Monte Carlo method for approximating pi. Pi.estimate() can plot around 8E37 values so the upper limit is most likely how much time you want to devote your machine to processing.

    Use cases:
        low_fidelity_pi = mojo_estimate_pi(100)
        high_fidelity_pi = mojo_estimate_pi(1000000)
    """
    if samples == 0:
        raise ("Number of samples cannot be 0")

    var x_ptr = UnsafePointer[Scalar[type]].alloc(samples)
    var y_ptr = UnsafePointer[Scalar[type]].alloc(samples)
    rand[type](x_ptr, samples, min=-1.0, max=1.0)
    rand[type](y_ptr, samples, min=-1.0, max=1.0)
    var y_buf = NDBuffer[type, 1](y_ptr, samples)
    var x_buf = NDBuffer[type, 1](x_ptr, samples)
    var inside: Float32 = 0.0
    for i in range(samples):
        var x = x_buf[i]
        var y = y_buf[i]
        var d = x * x + y * y
        if d <= 1.0:
            inside += 1.0

    x_ptr.free()
    y_ptr.free()

    return 4.0 * inside / Float32(samples)
