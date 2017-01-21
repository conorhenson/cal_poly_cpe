
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
  for num in list[3:]:
    miniList.append(num)
    if len(miniList) > 2:
      newList.append(miniList)
      miniList = []
  return newList

def decrypt_puzzle(list,f):
	for pixel in list:
		if int(pixel[0]) * 10 < 256:
			f.write(('%s \n') %(int(pixel[0]) * 10))
			f.write(('%s \n') %(int(pixel[0]) * 10))
			f.write(('%s \n') %(int(pixel[0]) * 10))
		else:
			f.write(('%s \n') %('255'))
			f.write(('%s \n') %('255'))
			f.write(('%s \n') %('255'))
	return 0

def main():
	if len(argv) > 2 or len(argv) < 2:
		print 'Usage: python {0} <image>'.format(argv[0])
		exit()
	f = open('hidden.ppm','w')
	f.write(('%s \n') %(read_file()[0]))
	f.write(('%s \n') %(read_file()[1]))
	f.write(('%s \n') %(read_file()[2]))
	decrypt_puzzle(groups_of_3(read_file()), f)
	f.close()

if __name__ == '__main__':
	main()