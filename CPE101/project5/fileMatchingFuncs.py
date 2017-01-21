#Project 5 - File Matching
#Conor Henson
#101-05
#Workman
class Entry:
	def __init__(self, account_num, name, balance, phone, city):
		self.account_num = account_num
		self.name = name
		self.balance = balance
		self.phone = phone
		self.city = city

	def __eq__(self, other):
		return (self.account_num == other.account_num and self.name == other.name and self.balance == other.balance and self.phone == other.phone and self.city == other.city)

def read_file(filename):
    mazeFile = open(filename, 'r')
    lines = mazeFile.readlines()
    entrys = []
    info = []
    for line in lines:
    	line = line.split()
    	line[1:3] = [' '.join(line[1:3])]
    	entrys.append(line)
    for i in range(len(entrys)):
    	info.append(Entry(entrys[i][0], entrys[i][1], float(entrys[i][2]), entrys[i][3], entrys[i][4]))
    return info

def read_file_transaction(filename):
    mazeFile = open(filename, 'r')
    lines = mazeFile.readlines()
    entrys = []
    info = []
    for line in lines:
    	line = line.split()
    	entrys.append(line)
    for i in range(len(entrys)):
    	info.append(Entry(entrys[i][0], None, float(entrys[i][1]), None, None))
    return info

def sorting(info):
	return sorted(info, key=lambda person: person.account_num)
	
def combine(y,x):
	for i in range(len(y)):
		count = True
		for j in range(len(x)):
			if x[j].account_num == y[i].account_num:
				x[j].balance += y[i].balance
				count = False
		if count:
			print 'Unmatched transaction record for account', y[i].account_num
	return x

def write_file_old(Master):
	f = open('sorted_oldMaster.dat','w')
	for line in Master:
		f.write(('%s %2s %-5.2f %5s %2s\n') %(line.account_num, line.name, line.balance, line.phone, line.city))
	f.close()
 
def write_file_new(Master):
	f = open('newMaster.dat','w')
	for line in Master:
		f.write(('%s %2s %-5.2f %5s %2s\n') %(line.account_num, line.name, line.balance, line.phone, line.city))
	f.close()

def main():
	x = sorting(read_file('in3.dat'))
	y = sorting(read_file_transaction('t3.dat'))
	write_file_old(x)
	combine(y,x)
	write_file_new(x)

if __name__ == '__main__':
	main()
