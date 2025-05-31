import random
@value
struct Pi():
	def estimate(self, area_square: UInt64) -> Float64:
		# if area_square less than 4, return 0, no way to inscribe a circle with discrete values
		# derive the radius, something like floor(sqrt(area_square)/2), taking the floor so the circle may not exceed the boundaries of the square
		# set r2 to radius**2
		# circle_area = 0
		# for _ in range(area_square):
		#  if the randomly generated point in x range (-radius, radus) and y range(-radius, radius) is inside the circle, ten circle_area ++
		#pi == circle_area*square_area /4 
		return 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647

		
		


