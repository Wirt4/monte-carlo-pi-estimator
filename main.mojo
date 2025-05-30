from modules.pi_estimator import Pi
fn main():
    var samples: Int = 10000
    var result: Float64
    try:
        result = Pi().estimate(samples)
    except e:
        print("an error with the estimator has occurred")
    else:
        print("Estimated Pi (", samples, " samples): ", result)

