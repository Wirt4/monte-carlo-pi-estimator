from modules.pi_estimator import Pi
fn main():
    var samples: Int = 10_000
    var result: Float64
    result = Pi.estimate_pi(samples)
    print("Estimated Pi (", samples, " samples): ", result)
