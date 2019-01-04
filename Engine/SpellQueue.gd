extends Object

var queue = []

func push(spell):
	queue.push(spell)

func pop(spell):
	return queue.pop(spell)

func peek(spell):
	return queue[0]