
#######
#  Conor Henson
#  Professor Workman
#  CPE 101/ Project 3 
#######
def get_cages():
	cages = []
	numCages = input('Number of cages: ')
	if numCages > 0:
		for i in range(numCages):
			tempCage = raw_input('Cage number {0:0d}: '.format(i)).split() 
			cages.append([int(x) for x in tempCage])                                    
	return cages

def check_rows_valid(puzzle):
	for row in puzzle:
		for num in row:
			if num > 5:
				return False
		for j in range(1,6):
			if row.count(j) <= 1:
				continue
			else: 
				return False
	return True		

def check_columns_valid(puzzle):
	colChecker = []
	for i in range(len(puzzle)):
		col = []
		for j in range(len(puzzle[i])):
			if puzzle[i][j] > 5:
				return False
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
		zeroIn = False
		cageSum = 0
		for j in i[2:]:
			r = j / 5
			c = j % 5         
			cageSum += puzzle[r][c]
			if puzzle[r][c] == 0:
				zeroIn = True 
		if zeroIn == True and cageSum >= int(i[0]):
		  return False
		elif zeroIn == False and cageSum != int(i[0]):
		  return False
	return True
		
def check_valid(puzzle, cages):
	return check_cages_valid(puzzle, cages) and check_columns_valid(puzzle) and check_rows_valid(puzzle)
	
