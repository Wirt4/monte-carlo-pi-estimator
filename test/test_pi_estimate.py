import unittest
from random import seed

from modules.python_pi import python_estimate_pi


class TestEstimatePi(unittest.TestCase):
    def test_pi_range(self):
        """Given a sample size of 1000, when python_estimate_pi is called, then the result is between 2 and 4"""
        est = python_estimate_pi(1000)
        self.assertTrue(2.0 < est and est < 4.0)

    def test_rough_accuracy(self):
        """Given a seeded RNG and a sample size of 500, when python_estimate_pi is called, then the result is close to 3.1 within a tolerance of 0.3"""
        seed(42)
        est = python_estimate_pi(500)
        self.assertTrue(abs(est - 3.1) < 0.3)

    def test_accuracy_improves_with_more_points(self):
        """Given sample sizes of 10 and 1000, when python_estimate_pi is called with each, then the larger sample size will produce an ouput closer to pi than the smaller"""
        est_10 = python_estimate_pi(10)
        est_1000 = python_estimate_pi(1000)
        self.assertTrue(abs(est_1000 - 3.14159) < abs(est_10 - 3.14159))

    def test_raises_if_0(self):
        """Given an sample size that's less than or equal to zero, when python_estimate_pi is called, then it raises an error"""
        with self.assertRaises(ValueError):
            python_estimate_pi(0)

        with self.assertRaises(ValueError):
            python_estimate_pi(-4)


if __name__ == "__main__":
    unittest.main()
