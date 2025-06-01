from testing import assert_true, assert_almost_equal, assert_equal
from modules.pi_estimator import Pi
from random import seed

def test_pi_range():
    """Basic case

    Given a low number of samples, when estimate() is run, then it
    returns a value of 3. <some sequence>
    """
    est = Pi().estimate(100)
    assert_true(est > 2.0 and est < 4.0)

def test_rough_accuracy():
    """
    Rough estimate

    Given that estimate is seeded with 500 samples and the random seed value is controlled, when estimate outputs an approximation, it should be within .30 of pi

    """
    seed(42)
    est = Pi().estimate(500)
    assert_true(abs(est -3.1) < 0.3)

def test_accuracy_improves_with_more_points():
    """
    More samples means higher accuracy.

    Given that estimate is called with 10 and 1000 samples, when the calls are processed, then the call with 1000 samples will be closer to pi than the call with 10 samples.
    """
    pi = Pi()
    est_10 = pi.estimate(10)
    est_1000 = pi.estimate(1000)
    assert_true(abs(est_1000 - 3.14159) < abs(est_10 - 3.14159))
