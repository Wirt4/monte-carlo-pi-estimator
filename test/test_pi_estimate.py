import unittest

from modules.pi_estimator import python_estimate_pi


class TestEstimatePi(unittest.TestCase):
    def test_pi_range(self):
        est = python_estimate_pi(1000)
        self.assertTrue(2.0 < est and est < 4.0)


if __name__ == "__main__":
    unittest.main()
