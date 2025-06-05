import sys
import time

from .python_pi import python_estimate_pi


def benchmark(
    fn, min_runtime=2.0, max_runtime=60.0, warmup_iters=2, max_iters=1_000_000_000
):
    warmup_total = 0.0

    # Warmup phase
    for _ in range(warmup_iters):
        t0 = time.perf_counter()
        fn()
        t1 = time.perf_counter()
        warmup_total += t1 - t0

    timings = []
    total_time = 0.0
    iters = 0

    # Benchmark phase (adaptive)
    while total_time < min_runtime and iters < max_iters and total_time < max_runtime:
        t0 = time.perf_counter()
        fn()
        t1 = time.perf_counter()
        elapsed = t1 - t0
        timings.append(elapsed)
        total_time += elapsed
        iters += 1

    if iters == 0:
        raise RuntimeError("Benchmark function executed too quickly to measure.")

    mean = sum(timings) / iters
    fastest = min(timings)
    slowest = max(timings)

    # Mojo-style report (milliseconds)
    print("-" * 45)
    print("Benchmark Report (ms)")
    print("-" * 45)
    print(f"Mean: {mean * 1000}")
    print(f"Total: {total_time}")
    print(f"Iters: {iters}")
    print(f"Warmup Total: {warmup_total}")
    print(f"Fastest Mean: {fastest * 1000}")
    print(f"Slowest Mean: {slowest * 1000}")


if __name__ == "__main__":
    samples = int(sys.argv[1]) if len(sys.argv) > 1 else 1_000_000

    benchmark(lambda: python_estimate_pi(100000))
