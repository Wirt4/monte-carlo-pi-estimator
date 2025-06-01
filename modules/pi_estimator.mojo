from random import random_float64
@value
struct Pi():
	fn estimate(self, n: Int) -> Float64:
		c = 0
		for _ in range(n):
			x = random_float64(-1.0, 1.0)
			y = random_float64(-1.0, 1.0)
			if x*x + y*y <= 1:
				c +=1
		return 4 * c / n
