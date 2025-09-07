extends Node2D

func message(sender, msg, data):
	match msg:
		"swap":
			sender.process_mode = Node.PROCESS_MODE_DISABLED
			sender.visible = false
			data.process_mode = Node.PROCESS_MODE_ALWAYS
			data.visible = true
		"load":
			data.process_mode = Node.PROCESS_MODE_ALWAYS
			data.visible = true
		"unload":
			data.process_mode = Node.PROCESS_MODE_DISABLED
			data.visible = false
		"pause":
			data.process_mode = Node.PROCESS_MODE_DISABLED
		"resume":
			data.process_mode = Node.PROCESS_MODE_ALWAYS
		"quit":
			get_tree().quit()
		_:
			printerr("unrecognized message sent to loader")
		
		
