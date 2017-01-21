
from sys import *

def read_file():
	try:
	  pic = open(argv[1], 'r')
	except IOError:
		print 'Unable to open {0}'.format(argv[1])
		exit()
	value = []
	lines = pic.readlines()
	for line in lines:
		value.append(line.strip())
	return value

def groups_of_3(list):
        newList = []
        miniList = []
        count = 0
        for num in list[3:]:
                miniList.append(num)
                if len(miniList) > 2 or num == list[-1]:
                        newList.append(miniList)
                        count += 1
                        if len(miniList) != 3:
                        	break
                        miniList = []
        return newList

def decrypt_puzzle(list):
	newList = []
	for pixel in list:
		if int(pixel[0]) * 10 < 256:
			newList.append([int(pixel[0]) * 10,int(pixel[0])* 10,int(pixel[0]) * 10])
		else:
			newList.append(['255','255','255'])
	return newList

def write_file(file,first, second, third):
	f = open('new_puzzle.ppm','w')
	f.write(('%s \n') %(first))
	f.write(('%s \n') %(second))
	f.write(('%s \n') %(third))
	for line in file:
		for pixel in line:
			f.write(('%s \n') %(pixel))
	f.close()

def main():
	if len(argv) > 2 or len(argv) < 2:
		print 'Usage: python {0} <image>'.format(argv[0])
		exit()
	write_file(decrypt_puzzle(groups_of_3(read_file())), read_file()[0], read_file()[1], read_file()[2])

if __name__ == '__main__':
	main()