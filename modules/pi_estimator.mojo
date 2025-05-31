import random
@value
struct Pi():
	fn estimate(self, n: Int) -> Float64:
		c = 0
		for _ in range(n):
			x = random.random_float64(-1.0, 1.0)
			y = random.random_float64(-1.0, 1.0)
			if x**2 + y**2 <= 1.0:
				c +=1# because the radius is 1, then 1
		return 4 * c / n

		
		


