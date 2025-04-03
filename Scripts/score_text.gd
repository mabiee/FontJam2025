extends Control



#perfect = #e2c945
# good = #400ca0
# miss = #000000

func set_text_info(text: String):
	$RichTextLabel.text = "[center]" + text
	
	match text:
		"PERFECT":
			$RichTextLabel.set("theme_override_colors/default_color", Color('e2c945'))
		"GOOD":
			$RichTextLabel.set("theme_override_colors/default_color", Color('400ca0'))
		_:
			$RichTextLabel.set("theme_override_colors/default_color", Color('000000'))
