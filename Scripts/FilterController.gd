extends XRCamera3D

#onready var mesh = $MeshInstance3D
# Must be one greater than the highest value of filter since filters index at 0.
var num_filters = 6
var left_eye
var right_eye
# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance3D.custom_aabb = AABB(Vector3(0,0,0), Vector3(100, 100, 100))
	left_eye = $MeshInstance3D.get_active_material(0).get_shader_parameter("left_eye")
	right_eye = $MeshInstance3D.get_active_material(0).get_shader_parameter("right_eye")
	print($MeshInstance3D)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	

func change_left_eye():
	left_eye = (left_eye + 1) % num_filters
	$MeshInstance3D.get_active_material(0).set_shader_parameter("left_eye", left_eye)

func change_right_eye():
	right_eye = (right_eye + 1) % num_filters
	$MeshInstance3D.get_active_material(0).set_shader_parameter("right_eye", right_eye)
