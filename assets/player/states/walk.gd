extends MoveState

func enter():
	.enter()
	entity.animationHat.play(animation_name)


func input(event: InputEvent) -> BaseState:
	# First run parent code and make sure we don't need to exit early
	# based on its logic
	var new_state = .input(event)
	if new_state:
		return new_state
	
	return null
