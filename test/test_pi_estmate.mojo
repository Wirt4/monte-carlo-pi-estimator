from testing import assert_true, assert_almost_equal, assert_equal
from modules.pi_estimator import Pi
import random

def test_pi_range():
    pi = Pi().estimate(100)
    assert_true(pi > 2.0 and pi < 4.0)

def test_rough_accuracy():
    random.seed(42)
    pi = Pi().estimate(500)
    assert_true(abs(pi -3.1) < 0.3)

#def test_pi_estimate_short():
#    pi = Pi()
#    est = pi.estimate(100_000_000)
#    assert_true( 3.140 < est and est < 3.142)
#
#def test_pi_estimate_longer():
#    expected =   3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647
#    pi = Pi()
#    assert_almost_equal(expected, pi.estimate(1_000_000_000))

