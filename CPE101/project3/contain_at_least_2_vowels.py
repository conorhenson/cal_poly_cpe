words = ['Roy', 'Julie','Hi!','moon','MOON']
def contain_at_least_2_vowels(words):
  vowels = 'aeiouAEIOU'
  newWords = []
  for name in words:
  	count = 0
  	for char in name:
  		if char in vowels:
  			count += 1
  	if count >= 2:
  		newWords.append(name)
  return newWords

print contain_at_least_2_vowels(words)

