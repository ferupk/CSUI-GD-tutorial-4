extends Camera2D

const LOOK_AHEAD_FACTOR = 0.1
const SHIFT_TRANS = Tween.TRANS_SINE
const SHIFT_EASE = Tween.EASE_OUT
const SHIFT_DURATION = 1.2

var facing = 0
@onready var prev_camera_pos = get_screen_center_position()
@onready var tween: Tween


func _ready() -> void:
	reset_smoothing()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_check_facing()
	prev_camera_pos = get_screen_center_position()


func _check_facing():
	var new_facing = sign(get_screen_center_position().x - prev_camera_pos.x)
	if new_facing != 0 && facing != new_facing:
		facing = new_facing
		var target_offset = get_viewport_rect().size.x * LOOK_AHEAD_FACTOR * facing

		tween = create_tween()
		tween.tween_property(self, "position:x", target_offset, SHIFT_DURATION).set_trans(SHIFT_TRANS).set_ease(SHIFT_EASE)
