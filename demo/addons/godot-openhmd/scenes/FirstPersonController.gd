extends ARVROrigin

var arvr_interface : ARVRInterface = null

func _ready():
	# find our arvr interface device
	var interface = ARVRServer.find_interface("OpenHMD")
	if interface and interface.initialize():
		arvr_interface = interface
	
	# list devices
	print("Listing devices:")
	var list_devices = $OpenHMDConfig.list_devices()
	for device in list_devices:
		print("Device " + str(device['device_no']) + " " + device['vendor'] + " - " + device['product'])
	$SetupDialog.set_device_list(list_devices)
	
	# and show our settings
	$SetupDialog.visible = true

func _on_SetupDialog_do_init():
	# and then just find the interface
	if arvr_interface:
		# get our settings
		var hmd = $SetupDialog.get_hmd()
		if hmd != -1:
			$OpenHMDConfig.init_hmd_device(hmd)

		var tracking_device = $SetupDialog.get_tracking_device()
		if tracking_device != -1:
			$OpenHMDConfig.init_tracking_device(tracking_device)
		
		var controller_1 = $SetupDialog.get_controller_1()
		if controller_1 != -1:
			$OpenHMDConfig.init_controller_device(controller_1)

		var controller_2 = $SetupDialog.get_controller_2()
		if controller_2 != -1:
			$OpenHMDConfig.init_controller_device(controller_2)

		# check oversample
		print("Oversample was: " + str($OpenHMDConfig.get_oversample()))
		$OpenHMDConfig.set_oversample($SetupDialog.get_oversample())
		
		# make sure our physics engine runs at the correct speed
		Engine.iterations_per_second = 90
		
		# and tell our viewport to render
		get_viewport().arvr = true
