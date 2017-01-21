from funcs import *
def main():
	puzzle = make_puzzle()
	words = split_words()
	#Formats the puzzle
	print 'Puzzle:'
	print ""
	for row in puzzle:
		print row
	print ""
	#checking words in rows and colunms 
	for word in words:
		placeOfWord = ()
		placeOfWord = check_rows_valid(puzzle, word)
		if not placeOfWord:
			placeOfWord = check_columns_valid(puzzle, word)
		if not placeOfWord:
			placeOfWord = 'word not found'
		#formats the words and info
		if placeOfWord == 'word not found':
			print '{0}: {1}'.format(word, placeOfWord)
		else:
			print '{0}: ({1}) row: {2} column: {3}'.format(word, placeOfWord[2], placeOfWord[0], placeOfWord[1])
if __name__ == '__main__':
	main()
