import random
@value
struct Pi():
	def estimate(self, n: Int) -> Float64:
		# assumes n is the random distribution of points in a square of range [-1.0, 1.0]
		c = 0
		random.seed()
		for _ in range(n):
			# get the random plot
			x = random.random_float64(-1.0, 1.0)
			y = random.random_float64(-1.0, 1.0)
			if (x**2 + y**2)**0.5 <= 1.0: # because the radius is 1, then 1 == 1**2
				c += 1
		estimate = 4 * c / n
		print ('estimate', estimate)
		return estimate

		
		


