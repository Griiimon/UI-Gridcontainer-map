extends PanelContainer

@onready var label = $Label

func set_text(_text: String):
	label.text= _text
