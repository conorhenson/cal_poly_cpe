inFile = open("junk.txt", "r") #must exist, or causes exception
outFile = open("copy.txt", "w") #created if does not exist, erased if exists

line_num = 1   
for line in inFile:
   outFile.write(str(line_num) + ': ' + line)
   line_num += 1
