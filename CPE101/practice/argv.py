from sys import * 

#if len(argv) != 2:
	#print 'usage: filename'
	#exit()

try:
	inFile = open(argv[1], 'r')
except IOError as e:
	print e
	print 'Unable to open file {0}'.format(argv[1])
	exit()
except IndexError:
	print 'Usage: filename'
	exit()

for line in inFile:
	print line.strip()