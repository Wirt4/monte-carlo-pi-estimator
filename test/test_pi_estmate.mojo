from testing import assert_true, assert_almost_equal, assert_equal
from modules.pi_estimator import Pi
from random import seed

def test_pi_range():
    est = Pi().estimate(100)
    assert_true(est > 2.0 and est < 4.0)

def test_rough_accuracy():
    seed(42)
    est = Pi().estimate(500)
    assert_true(abs(est -3.1) < 0.3)

def test_accuracy_improves_with_more_points():
    pi = Pi()
    est_10 = pi.estimate(10)
    est_1000 = pi.estimate(1000)
    assert_true(abs(est_1000 - 3.14159) < abs(est_10 - 3.14159))
