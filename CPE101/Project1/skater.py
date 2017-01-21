# Project 1
#
# Name: Conor Henson
# Instructor: J. Workman
# Section: 05
from funcs import *
from math import *
def main():
	skaterWeight = raw_input("How much do you weigh (pounds)? ")
	distanceFromTarget = input("How far away is your professor (meters)? ")
	projectile = raw_input("Will you throw a rotten (t)omato, banana cream (p)ie, (r)ock, (l)ight saber, or a lawn (g)nome? ")
	print "Nice throw!", massStatment(getMassObject(projectile), distanceFromTarget)
	print "Velocity of Skater:", round(getVelocitySkater(poundsToKG(float(skaterWeight)), getMassObject(projectile), getVelocityObject(float(distanceFromTarget))), 3), "m/s"
	print velocityStatment(getVelocitySkater(poundsToKG(float(skaterWeight)), getMassObject(projectile), getVelocityObject(float(distanceFromTarget))))

if __name__ == '__main__':
	main()
