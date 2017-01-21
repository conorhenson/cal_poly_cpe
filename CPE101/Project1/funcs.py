from math import *
from skater import *

def poundsToKG(pounds):
  return pounds * .453592  # converts pounds to kilograms

def getMassObject(object):
	if object == 't':
		return .1
	elif object == 'p':
		return 1.0
	elif object == 'r':
		return 3.0
	elif object == 'g':
		return 5.3
	elif object == 'l':
		return 9.07
	else:
		return 0.0

def getVelocityObject(distance):
	g = 9.8  # gravity 9.8 m/s
	return sqrt((g * distance) / 2)

def getVelocitySkater(massSkater, massObject, VelObject):
	return ((massObject * VelObject) / massSkater)

def massStatment(mass, distanceFromTarget):
	if mass <= .1:
		return "You're going to get an F!"
	if mass > .1 and mass <= 1.0:
		return "Make sure your Professor is OK"
	if distanceFromTarget >= 20.0 and mass >= 1.0:
		return "RIP Professor"
	if distanceFromTarget < 20.0 and mass >= 1.0:
		return "How far away is the hospital?"

def velocityStatment(velocity):
	if velocity < 0.2:
		return "My grandmother skates faster than you!"
	if velocity >= 1.0:
		return "Look out for that railing!!!"
