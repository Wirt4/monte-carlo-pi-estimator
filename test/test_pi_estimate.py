import unittest
from random import seed

from modules.pi_estimator import python_estimate_pi


class TestEstimatePi(unittest.TestCase):
    def test_pi_range(self):
        est = python_estimate_pi(1000)
        self.assertTrue(2.0 < est and est < 4.0)

    def test_rough_accuracy(self):
        seed(42)
        est = python_estimate_pi(500)
        self.assertTrue(abs(est - 3.1) < 0.3)

    def test_accuracy_improves_with_more_points(self):
        est_10 = python_estimate_pi(10)
        est_1000 = python_estimate_pi(1000)
        self.assertTrue(abs(est_1000 - 3.14159) < abs(est_10 - 3.14159))

    def test_raises_if_0(self):
        with self.assertRaises(ValueError):
            python_estimate_pi(0)


if __name__ == "__main__":
    unittest.main()
