#######
#  Conor Henson
#  Professor Workman
#  CPE 101/ Project 3 
#######
from solverFuncs import * 
puzzle = [ [0] * 5 for x in range(5)]
def main():
	def solver(puzzle, cages):
		checks = backtracks = row = col = 0
		while row < 5:  
			puzzle[row][col] += 1
			if check_valid(puzzle, cages) == False and puzzle[row][col] > 4:
				backtracks += 1
				puzzle[row][col] = 0
				col -= 1
				if col < 0:
					col = 4
					row -= 1
			elif check_valid(puzzle, cages):
				col += 1 
				if col >= 5:
				  col = 0
				  row += 1
			checks += 1
		return [puzzle, checks, backtracks]
	t = solver(puzzle,get_cages())
	print ""
	print "---Solution---"
	print""
	for i in range(len(puzzle)):
		for j in range(len(puzzle[i])):
				print "%d" % puzzle[i][j],
		print ""
	print ""
	print "checks: {0:0d}".format(t[1]),
	print "backtracks: {0:0d}".format(t[2])

	
if __name__ == '__main__':
	main()