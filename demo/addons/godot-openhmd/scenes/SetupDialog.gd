extends PopupDialog

signal do_init()

var devices : Array = Array()

func set_device_list(p_devices : Array):
	$Container/HMD/Devices.clear()
	$Container/Tracker/Devices.clear()
	$Container/Controller1/Devices.clear()
	$Container/Controller2/Devices.clear()
	
	$Container/Tracker/Devices.add_item('None')
	$Container/Controller1/Devices.add_item('None')
	$Container/Controller2/Devices.add_item('None')

	devices = p_devices
	for device in devices:
		$Container/HMD/Devices.add_item(device['vendor'] + " - " + device['product'])
		$Container/Tracker/Devices.add_item(device['vendor'] + " - " + device['product'])
		$Container/Controller1/Devices.add_item(device['vendor'] + " - " + device['product'])
		$Container/Controller2/Devices.add_item(device['vendor'] + " - " + device['product'])

func get_hmd():
	var device = $Container/HMD/Devices.selected
	return devices[device]['device_no']

func get_tracking_device():
	var device = $Container/Tracker/Devices.selected
	if device > 0:
		return devices[device-1]['device_no']
	return -1

func get_controller_1():
	var device = $Container/Controller1/Devices.selected
	if device > 0:
		return devices[device-1]['device_no']
	return -1

func get_controller_2():
	var device = $Container/Controller2/Devices.selected
	if device > 0:
		return devices[device-1]['device_no']
	return -1

func get_oversample():
	return $Container/Oversample/SpinBox.value

func _on_SetupDialog_about_to_show():
	get_tree().paused = true

func _on_SetupDialog_popup_hide():
	get_tree().paused = false

func _on_Init_pressed():
	# add some checks here...
	
	# and init
	emit_signal("do_init")
	visible = false

