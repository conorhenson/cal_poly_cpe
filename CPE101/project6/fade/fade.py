from sys import *
from math import *
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
        for num in list[3:]:
                miniList.append(num)
                if len(miniList) > 2:
                        newList.append(miniList)
                        miniList = []
        return newList

def fade_puzzle(list, cy, cx, radius,f):
	finalCol = int(read_file()[1].split()[0])
	row = 0.0
	col = 0.0
	for pixel in list:
		dis = sqrt(((float(cy) - row) ** 2) + ((float(cx) - col) ** 2))
		scale = (float(radius) - dis) / float(radius)
		col += 1
		if col >= int(finalCol):
			col = 0.0
			row += 1
		if scale >= .2:
			for x in pixel:
				f.write(('%s \n') %(int(int(x) * scale)))
		else:
			for x in pixel:
				f.write(('%s \n') %(int(int(x) * .2)))
	return 

def main():
	if len(argv) > 5 or len(argv) < 5:
		print 'Usage: python {0} <image> <row> <column> <radius>'.format(argv[0])
		exit()
	f = open('faded.ppm','w')
	f.write(('%s \n') %(read_file()[0]))
	f.write(('%s \n') %(read_file()[1]))
	f.write(('%s \n') %(read_file()[2]))
	fade_puzzle(groups_of_3(read_file()), argv[2], argv[3], argv[4], f)
	f.close()

if __name__ == '__main__':
	main()