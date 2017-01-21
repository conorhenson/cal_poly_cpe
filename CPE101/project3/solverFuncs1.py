#puzzle = [ [0] * 5 for x in range(5)]
#puzzle = [[4, 1, 2, 5, 3],[1, 5, 4, 3, 2], [2, 3, 5, 4, 1], [3, 4, 1, 2, 5], [5, 2, 3, 1, 4]]
def get_cages():
	cages = []
	numCages = input('Number of cages: ')
	if numCages > 0:
		for i in range(numCages):
			tempCage = raw_input('Cage number %d: ' % i).split()
			cages.append(tempCage)
	return cages

def check_rows_valid(puzzle):
	for i in range(len(puzzle)):
		for j in range(1,6):
			if puzzle[i].count(j) <= 1:
				continue
			else: 
				return False
	return True		

def check_columns_valid(puzzle):
	colChecker = []
	for i  in range(len(puzzle)):
		col = []
		for j in range(len(puzzle[i])):
			col.append(puzzle[j][i])
		colChecker.append(col)
	for i in range(len(puzzle)):
		for k in range(1,6):
		  	if colChecker[i].count(k) <= 1:
		  		continue
		  	else:
		  		return False
	return True

def check_cages_valid(puzzle, cages1):
	for i in cages1:
		cageSum = 0
		zeroIn = False
		for j in i[2:]:
			r = int(j) / 5
			c = int(j) % 5
			if puzzle[r][c] == 0:
				zeroIn = True
			cageSum += puzzle[r][c]
		if cageSum == int(i[0]):
			if zeroIn:
				return False
			else:
			  continue
		else: 
			return False
	return True
		
def check_valid(puzzle, cages):
	return check_cages_valid(puzzle, cages) and check_columns_valid(puzzle) and check_rows_valid(puzzle)
		
  








