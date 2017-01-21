inFile = open('junk.txt', 'r')
outFile = open('copy.txt', 'w')

line_num = 1
for line in inFile:
	outFile.write(str(line_num) + ': ' + line)
	line_num += 1
	