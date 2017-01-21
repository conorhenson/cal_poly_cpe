import unittest
from funcs import * 
puzzle = ['WAQHGTTWEE', 'CBMIVQQELS', 'AZXWKWIIIL', 'LDWLFXPIPV', 'PONDTMVAMN', 'OEDSOYQGOB', 'LGQCKGMMCT', 'YCSLOACUZM', 'XVDMGSXCYZ', 'UUIUNIXFNU']
words = ['UNIX', 'CALPOLY', 'GCC', 'SLO', 'COMPILE', 'VIM', 'TEST'] 
class TestCases(unittest.TestCase):
	
	def test_check_rows_valid_0(self):
		self.assertEqual(check_rows_valid(puzzle, 'UNIX'), (9,3, 'FORWARD'))
	def test_check_rows_valid_1(self):
		self.assertEqual(check_rows_valid(puzzle, 'VIM'), (1,4, 'BACKWARD'))
	def test_check_columns_valid_0(self):
		self.assertEqual(check_columns_valid(puzzle, 'CALPOLY'), (1, 0, 'DOWN'))
	def test_check_columns_valid_1(self):
		self.assertEqual(check_columns_valid(puzzle, 'COMPILE'), (6, 8, 'UP'))
	#ran one test for puzzle and word maker/spliter
	def test_make_puzzle_0(self):
		self.assertEqual(make_puzzle(), puzzle)
	def test_split_words_0(self):
		self.assertEqual(split_words(), words)

if __name__ == '__main__':
   unittest.main()