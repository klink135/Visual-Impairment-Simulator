extends Node3D

var xr_interface: XRInterface
@onready var left = $XROrigin3D/XRController3D
@onready var right = $XROrigin3D/XRController3D2
@onready var camera = $XROrigin3D/XRCamera3D

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
		
	else:
		print("OpenXR not initialized, please check if your headset is connected")
	# Tie the controller signal to a function in this object so we can call anything we need to
	left.button_pressed.connect(_left_button_pressed)
	right.button_pressed.connect(_right_button_pressed)

func _physics_process(_delta):
	pass

# Handles all button signals for the left hand, need to specify which one you want on the action map
func _left_button_pressed(button):
	if (button == "trigger_click"):
		camera.change_left_eye()

func _right_button_pressed(button):
	if (button == "trigger_click"):
		camera.change_right_eye()
