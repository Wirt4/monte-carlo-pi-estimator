# Content of test_quickstart.mojo
from testing import assert_equal
from modules.pi_estimator import Pi


def test_pi_estimate():
    # This test contains an intentional logical error to show an example of
    # what a test failure looks like at runtime.
    pi = Pi()
    assert_equal(pi.estimate(10), 3.14)

