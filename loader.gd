extends Node2D

func message(sender, msg, data):
	match msg:
		"swap":
			sender.process_mode = Node.PROCESS_MODE_DISABLED
			sender.visible = false
			data.process_mode = Node.PROCESS_MODE_PAUSABLE
			data.visible = true
		_:
			printerr("unrecognized message sent to loader")
		
		
