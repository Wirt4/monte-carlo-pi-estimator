import time


class Benchmark:
    def __init__(self, min_runtime=3.0, max_runtime=4.0, warmup_iters=1, max_iters=2):
        self._min_runtime = min_runtime
        self._max_runtime = max_runtime
        self._warmup_iters = warmup_iters
        self._max_iters = max_iters

    def run(self, fn):
        """Returns a Report object containing the timings and iterations run

        Givens are the min runtime, max runtime, warmup iterations and max iterations passed in the constructor.
        """
        self._set_track_stats()
        # Warm-Up runs
        for _ in range(self._warmup_iters):
            t0 = time.perf_counter()
            fn()
            self._warmup_total += time.perf_counter() - t0

        # Benchmark run
        while self._total_time < self._min_runtime or self._iters < self._max_iters:
            t0 = time.perf_counter()
            fn()
            elapsed = time.perf_counter() - t0
            self._timings.append(elapsed)
            self._total_time += elapsed
            self._iters += 1

            if self._total_time >= self._max_runtime:
                break

        if self._iters == 0:
            raise RuntimeError("Benchmark function executed too quickly to measure.")
        else:
            return Report(
                timings=self._timings,
                iters=self._iters,
                total_time=self._total_time,
                warmup_total=self._warmup_total,
            )

    def _set_track_stats(self):
        self._timings = []
        self._iters = 0
        self._total_time = 0.0
        self._warmup_total = 0.0


class Report:
    def __init__(self, timings, iters, total_time, warmup_total):
        self._timings = timings
        self._total_time = total_time
        self._iters = iters
        self._warmup_total = warmup_total

    def print(self):
        """Prints the execution mean, total, iterations, warmup total, fastest mean and slowest mean from the benchmark run."""
        self._print_divider()
        print("Benchmark Report (s)")
        self._print_divider()
        self._print_f("Mean", self._total_time / self._iters)
        self._print_f("Total", self._total_time)
        self._print_f("Iters", self._iters)
        self._print_f("Warmup Total", self._warmup_total)
        self._print_f("Fastest Mean", min(self._timings))
        self._print_f("Slowest Mean", max(self._timings))
        print("")

    def _print_divider(self):
        print("-" * 45)

    def _print_f(self, label, value):
        print(f"{label}: {value}")
