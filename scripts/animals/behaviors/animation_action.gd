class_name AnimationAction extends ActionLeaf


@export var animations: Array[String] = []
@export_range(0.01, 10, 0.1, "suffix:x") var animation_speed_multiplier: float = 1


func tick(actor: Node, blackboard: Blackboard) -> int:
	var animal: Animal = actor
	if !animal.animations.is_playing() || !animations.has(animal.animations.current_animation):
		animal.animations.play(animations.pick_random(), 0.2, animation_speed_multiplier)
	return RUNNING


func before_run(actor: Node, blackboard: Blackboard) -> void:
	var animal: Animal = actor as Animal
	animal.acceleration_direction = Vector2.ZERO
	animal.animations.play(animations.pick_random(), 0.2, animation_speed_multiplier)
