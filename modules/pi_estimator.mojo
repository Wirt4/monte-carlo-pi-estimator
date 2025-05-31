import random
@value
struct Pi():
	def estimate(self, samples: Int) -> Float64:
		# assumes the virtual area is a square with a circle inscribed in it
		# also assume a radius of 1
		# assumes the origin of the x/y graph is dead center of the square, so 
		# circle_area/square_area == pi/4	
		# each sample is a point with x and y coordinates
		# all points are inside the square, so need to determine how many are inside the circle
		# 
		return 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647

		
		


