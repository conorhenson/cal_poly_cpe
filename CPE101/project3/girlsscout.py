sales = [(32, 'Alex', 'Betty', 'Carol'),
         (17, 'Dana', 'Ellie', 'Fran'),]
again = 'y'
while again == 'y':
	girl = raw_input('Which girl? ')
	boxes = -1 
	for group in sales:
		if girl in group:
			boxes = group[0]
			break
	if boxes == -1:
		print girl, "isn't in the troop!"
	else:
		print girl, 'sold', boxes, 'boxes!'
	again = raw_input('Again (y/n)?' )