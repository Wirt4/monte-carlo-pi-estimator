from modules.pi_estimator import Pi
import time # for dirty benchmarking
fn main():
    var samples: Int = 10_000
    var result: Float64
    start = time.perf_counter() # dirty benchmark
    result = Pi().estimate(samples)
    end = time.perf_counter() # dirty benchmark
    print("Estimated Pi (", samples, " samples): ", result)
    print ("time to execute:", end - start, " seconds")
