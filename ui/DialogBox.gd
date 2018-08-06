extends RichTextLabel

var dialog = ["Hey! My name is Frank.", "You don't look like much do you, are you really ready for this?", "Ah yes, the so called 'Reaper Threat'."]
var page = 0

func _ready():
	self.bbcode_text = dialog[page]
	self.visible_characters = 0

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if self.visible_characters > self.get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				self.visible_characters = 0
				self.bbcode_text = dialog[page]
		else:
			self.visible_characters = self.get_total_character_count()

func _on_Timer_timeout():
	self.visible_characters += 1