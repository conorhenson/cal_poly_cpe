import unittest
from funcs import * 

class TestCases(unittest.TestCase):
	
	def test_P2K_1(self):
		self.assertAlmostEqual(poundsToKG(2.2), 0.9979024)
	def test_P2K_2(self):
		self.assertAlmostEqual(poundsToKG(100), 45.3592)
	def test_GMO_1(self):
		self.assertAlmostEqual(getMassObject('t'), .1)
	def test_GMO_2(self):
		self.assertAlmostEqual(getMassObject('p'), 1.0)
	def test_GMO_3(self):
		self.assertAlmostEqual(getMassObject('r'), 3.0)
	def test_GMO_4(self):
		self.assertAlmostEqual(getMassObject('g'), 5.3)
	def test_GMO_5(self):
		self.assertAlmostEqual(getMassObject('l'), 9.07)
	def test_GMO_6(self):
		self.assertAlmostEqual(getMassObject('m'), 0.0)
	def test_GVO_1(self):
		self.assertAlmostEqual(getVelocityObject(100), 22.1359436)
	def test_GVO_2(self):
		self.assertAlmostEqual(getVelocityObject(42), 14.34573107)
	def test_GVS_1(self):
		self.assertAlmostEqual(getVelocitySkater(100, .1, 50), 0.05)
	def test_GVS_2(self):
		self.assertAlmostEqual(getVelocitySkater(50, 9.07, 10), 1.814)
# Run the unit tests.
if __name__ == '__main__':
   unittest.main()

