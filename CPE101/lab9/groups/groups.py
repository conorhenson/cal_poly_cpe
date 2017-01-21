def groups_of_3(list):
	newList = []
	miniList = []
	for num in list:
		miniList.append(num)
		if len(miniList) > 2 or num == list[-1]:
			newList.append(miniList)
			miniList = []
	return newList 

