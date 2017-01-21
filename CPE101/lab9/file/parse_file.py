from sys import * 
ints = floats = other = totalSum = 0
if (len(argv) > 2 and not ('-s' in argv)) or len(argv) < 2:
	print 'Usage: [-s] {0}'.format(argv[0])
	exit()

try:
	inFile = open(argv[1], 'r')
except IOError:
	if len(argv) <  3:
		print 'Unable to open file {0}'.format(argv[1])
		exit()
	try:
		inFile = open(argv[2], 'r')
	except IOError:
		print 'Unable to open file {0}'.format(argv[1])
		exit()

lines = inFile.readlines()
for line in lines:
	line = line.split()
	for word in line:
		try:
			int(word)
			ints += 1 
			totalSum += int(word)
		except ValueError:
			try:
				float(word)
				floats += 1 
				totalSum += float(word)
			except ValueError:
				other += 1
				

print 'Ints: {0}'.format(ints)
print 'Floats: {0}'.format(floats)
print 'Other: {0}'.format(other)
if '-s' in argv:
	print 'Sum: {0}'.format(totalSum)
exit()
	