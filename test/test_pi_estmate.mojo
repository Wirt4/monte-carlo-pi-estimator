from testing import assert_true
from modules.pi_estimator import Pi


def test_pi_estimate():
    # This test contains an intentional logical error to show an example of
    # what a test failure looks like at runtime.
    pi = Pi()
    est = pi.estimate(10)
    assert_true( 3.140 < est and est < 3.142)

