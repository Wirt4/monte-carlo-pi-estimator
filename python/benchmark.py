import time


class Benchmark:
    def __init__(
        self, min_runtime=2.0, max_runtime=60.0, warmup_iters=2, max_iters=1_000_000_000
    ):
        self._min_runtime = min_runtime
        self._max_runtime = max_runtime
        self._warmup_iters = warmup_iters
        self._max_iters = max_iters

    def run(self, fn):
        self._set_track_stats()
        # Warm-Up run
        for _ in range(self._warmup_iters):
            t0 = time.perf_counter()
            fn()
            t1 = time.perf_counter()
            self._warmup_total += t1 - t0

        # Benchmark run
        while (
            self._total_time < self._min_runtime
            and self._iters < self._max_iters
            and self._total_time < self._max_runtime
        ):
            t0 = time.perf_counter()
            fn()
            t1 = time.perf_counter()
            elapsed = t1 - t0
            self._timings.append(elapsed)
            self._total_time += elapsed
            self._iters += 1

        if self._iters == 0:
            raise RuntimeError("Benchmark function executed too quickly to measure.")
        else:
            self._calculate_means()
            return Report(
                mean=self._mean,
                total_time=self._total_time,
                iters=self._iters,
                warmup_total=self._warmup_total,
                fastest=self._fastest,
                slowest=self._slowest,
            )

    def _calculate_means(self):
        self._mean = sum(self._timings) / self._iters
        self._fastest = min(self._timings)
        self._slowest = max(self._timings)

    def _set_track_stats(self):
        self._timings = []
        self._iters = 0
        self._total_time = 0.0
        self._warmup_total = 0.0


class Report:
    def __init__(self, mean, total_time, iters, warmup_total, fastest, slowest):
        self._mean = mean
        self._total_time = total_time
        self._iters = iters
        self._warmup_total = warmup_total
        self._fastest = fastest
        self._slowest = slowest

    def print(self):
        # only does milliseconds right now
        self._print_divider()
        print("Benchmark Report (ms)")
        self._print_divider()
        self._print_f("Mean", self._to_miliseconds(self._mean))
        self._print_f("Total", self._to_miliseconds(self._total_time))
        self._print_f("Iters", self._iters)
        self._print_f("Warmup Total", self._to_miliseconds(self._warmup_total))
        self._print_f("Fastest Mean", self._to_miliseconds(self._fastest))
        self._print_f("Slowest Mean", self._to_miliseconds(self._slowest))
        print("")

    def _print_divider(self):
        print("-" * 45)

    def _print_f(self, label, value):
        print(f"{label}: {value}")

    def _to_miliseconds(self, n):
        return n * 1000
