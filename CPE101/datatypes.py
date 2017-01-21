class Point:
	def __init__(self, x, y):
		self.x = x
		self.y = y

class Pet:
	def __init__(self, name, age = 0, isFixed = False):
		self.name = name
		self.age = age
		self.isFixed = isFixed

p1 = Pet('Layla', 4, True)

def print_pet(p):
	print 'Name: {0}, age: {1}, Fixed? {2}'.format(p.name, p.age, p.isFixed)

print_pet(p1)