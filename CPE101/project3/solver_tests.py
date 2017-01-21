import unittest
from solverFuncs import *

class TestCases(unittest.TestCase):
  def test_check_rows_valid_0(self):
    self.assertTrue(check_rows_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 3, 2], [2, 3, 5, 4, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 4]]), True)
  def test_check_rows_valid_1(self):
    self.assertTrue(check_rows_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 3, 2], [2, 3, 5, 0, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), True)
  def test_check_rows_valid_2(self):
    self.assertFalse(check_rows_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 2, 2], [2, 3, 5, 0, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), False)
  def test_check_rows_valid_3(self):
    self.assertFalse(check_rows_valid([[4, 1, 1, 5, 3],
      [1, 5, 4, 3, 2], [2, 3, 5, 0, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), False)
  def test_check_rows_valid_4(self):
    self.assertFalse(check_rows_valid([[4, 1, 1, 5, 3],
      [1, 5, 4, 2, 2], [2, 3, 5, 0, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), False)
  def test_check_columns_valid_0(self):
    self.assertTrue(check_columns_valid([[4, 1, 0, 5, 3],
      [1, 5, 4, 0, 2], [2, 3, 5, 0, 0], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), True)
  def test_check_columns_valid_1(self):
    self.assertTrue(check_columns_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 3, 2], [2, 3, 5, 4, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 4]]), True)
  def test_check_columns_valid_2(self):
    self.assertFalse(check_columns_valid([[4, 1, 1, 5, 3],
      [1, 5, 4, 0, 2], [2, 3, 5, 0, 0], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), False)
  def test_check_columns_valid_3(self):
    self.assertFalse(check_columns_valid([[4, 1, 0, 5, 3],
      [1, 5, 4, 5, 2], [2, 3, 5, 0, 0], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]]), False)
  def test_check_cages_valid_0(self):
    self.assertTrue(check_cages_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 3, 2], [2, 3, 5, 4, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 4]],[[5, 2, 0, 5], 
      [8, 3, 1, 2, 6], [8, 2, 3, 8], [6, 3, 4, 9, 14], [13, 3, 7, 12, 13], [5, 2, 10, 15], 
      [14, 4, 11, 16, 20, 21], [6, 3, 17, 18, 22], [10, 3, 19, 23, 24]]), True)
  def test_check_cages_valid_1(self):
    self.assertFalse(check_cages_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 3, 2], [2, 0, 5, 4, 1], [3, 0, 0, 2, 5], [5, 2, 3, 1, 4]],[[5, 2, 0, 5], 
      [8, 3, 1, 2, 6], [8, 2, 3, 8], [6, 3, 4, 9, 14], [13, 3, 7, 12, 13], [5, 2, 10, 15], 
      [14, 4, 11, 16, 20, 21], [6, 3, 17, 18, 22], [10, 3, 19, 23, 24]]), False)
  def test_check_cages_valid_2(self):
    self.assertTrue(check_cages_valid([[4, 1, 2, 5, 3],
      [1, 5, 4, 3, 2], [2, 3, 5, 4, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 0]],[[5, 2, 0, 5], 
      [8, 3, 1, 2, 6], [8, 2, 3, 8], [6, 3, 4, 9, 14], [13, 3, 7, 12, 13], [5, 2, 10, 15], 
      [14, 4, 11, 16, 20, 21], [6, 3, 17, 18, 22], [10, 3, 19, 23, 24]]), True)
  def assertListAlmostEqual(self, l1, l2):
    self.assertEqual(len(l1), len(l2))
    for el1, el2 in zip(l1, l2):
      self.assertAlmostEqual(el1, el2)

# Run the unit tests.
if __name__ == '__main__':
   unittest.main()

