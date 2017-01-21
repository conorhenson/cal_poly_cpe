import unittest
from pet import *

class PetTests(unittest.TestCase):
   def test_pet(self):
      p1 = Pet("Bailey", 7, True)
      self.assertEqual(p1.name, "Bailey")
      self.assertEqual(p1.age, 7)
      self.assertTrue(p1.isFixed)

   def test_pet2(self):
      p2 = Pet("Jameson")
      self.assertEqual(p2.name, "Jameson")
      self.assertEqual(p2.age, 0)
      self.assertFalse(p2.isFixed)


# Run the unit tests.
if __name__ == '__main__':
   unittest.main()

