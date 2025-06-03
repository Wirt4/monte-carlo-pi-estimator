import unittest

from modules.pi_estimator import python_estimate_pi


class TestEstimatePi(unittest.TestCase):
    def test_stub(self):
        number_of_lights = 4
        self.assertEqual(number_of_lights, 4)


if __name__ == "__main__":
    unittest.main()
