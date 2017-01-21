def make_puzzle():
	puzzle = raw_input('')
	tempPuzzle = ''
	newPuzzle = []
	for i in range(10):
		for j in range(i * 10,(i * 10)+ 10):
			tempPuzzle += puzzle[j]
		newPuzzle.append(tempPuzzle)
		tempPuzzle = ''
	return newPuzzle

def split_words():
	words = raw_input('')
	return words.split()

def check_rows_valid(puzzle, words):
	# Checks forward
	for row in puzzle:
		if row.find(words) != -1:		
			return (puzzle.index(row), row.find(words), 'FORWARD')
	# Checks backwards
	for row in puzzle:
		if row[::-1].find(words) != -1:		
			return (puzzle.index(row), 9 - row[::-1].find(words), 'BACKWARD')
	return False

def check_columns_valid(puzzle, words):
	colChecker = []
	#makes columns
	col = ''
	for i in range(len(puzzle)):
		for j in range(len(puzzle[i])):
			col += puzzle[j][i]
		colChecker.append(col)
		col = ''
	#Checks down
	for row in colChecker:
		if row.find(words) != -1:		
			return (row.find(words), colChecker.index(row), 'DOWN')
	#Checks up
	for row in colChecker:
		  if row[::-1].find(words) != -1:		
			  return ( 9 - row[::-1].find(words), colChecker.index(row), 'UP')
	return False
