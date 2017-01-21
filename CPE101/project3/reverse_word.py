def reverse_word(word):
	wordList = list(word)
	reverseWord = []
	for i in range(len(wordList) - 1, -1, -1):
		reverseWord.append(wordList[i])
	return''.join(reverseWord)

print reverse_word('banana')

def reverse_word_2(word):
	rev = list(word)
	i = 0
	j = len(word) - 1
	while i < j:
		temp = rev[j]
		rev[j] = rev[i]
		rev[i] = temp
		i += 1 
		j -= 1
	return ''.join(rev)

print reverse_word_2('banana') 