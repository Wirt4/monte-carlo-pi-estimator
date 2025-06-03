from testing import *
from modules import estimate_pi
from random import seed


def test_pi_range():
    est = estimate_pi(100)
    assert_true(est > 2.0 and est < 4.0)


def test_rough_accuracy():
    seed(42)
    est = estimate_pi(500)
    assert_true(abs(est - 3.1) < 0.3)


def test_accuracy_improves_with_more_points():
    est_10 = estimate_pi(10)
    est_1000 = estimate_pi(1000)
    assert_true(abs(est_1000 - 3.14159) < abs(est_10 - 3.14159))


def test_raises_zero_error():
    with assert_raises(contains="Number of samples cannot be 0"):
        _ = estimate_pi(0)
