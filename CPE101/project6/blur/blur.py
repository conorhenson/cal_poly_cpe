from sys import *
from math import *
def read_file():
	try:
	  pic = open(argv[1], 'r')
	except IOError:
		print 'Unable to open {0}'.format(argv[1])
		exit()
	lines = pic.readlines()
	value = [line.strip() for line in lines]
	return (value, value[1].split()[0], value[1].split()[1]) 

def groups_of_3(list):
  newList = []
  miniList = []
  for num in list[3:]:
    miniList.append(num)
    if len(miniList) > 2:
      newList.append(miniList)
      miniList = []
  return newList

def organ_puzzle(list,finalCol):
	newList = []
	rowList = []
	col = 0
	for i in range(len(list)):
		col += 1
		rowList.append(list[i])
		if col >= finalCol:
			col = 0
			newList.append(rowList)
			rowList = []
	return newList

def blur_finder(list, reach, row, col, finalCol, finalRow):
	r = g = b = count = 0 
	for i in range(max(row - reach, 0), min(row + reach + 1, finalRow)):
		for j in range(max(col - reach, 0), min(col + reach + 1, finalCol)):
			count += 1
			try:
				r += int(list[i][j][0])
				g += int(list[i][j][1])
				b += int(list[i][j][2])
			except:
				pass
	r = r / count
	b = b / count
	g = g / count
	return (r, g, b)

def make_image(list, reach, finalCol, finalRow):
	newList = []
	for row in range(finalRow + 1):
		for col in range(finalCol):
			t = blur_finder(list, reach, row , col, finalCol, finalRow)
			newList.append([t[0], t[1], t[2]])
	return newList

def write_file(file,first, second, third):
	f = open('blurred.ppm','w')
	f.write(('%s \n') %(first))
	f.write(('%s \n') %(second))
	f.write(('%s \n') %(third))
	for line in file:
		for pixel in line:
			f.write(('%s \n') %(pixel))
	f.close()

def main():
	reach = 4
	if not(len(argv) == 2 or len(argv) == 3):
		print 'Usage: python {0} <image> <OPTIONAL:reach>'.format(argv[0])
		exit()
	if len(argv) == 3:
		reach = argv[2]
	rf = read_file()
	write_file(make_image(organ_puzzle(groups_of_3(rf[0]), int(rf[1])), int(reach), int(rf[1]), int(rf[2])), rf[0][0], rf[0][1], rf[0][2])

if __name__ == '__main__':
	main()