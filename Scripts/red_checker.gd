extends Node2D

var highlightedSprite: Sprite2D
var TopLeft: TextureButton
var TopRight: TextureButton
var BottomLeft: TextureButton
var BottomRight: TextureButton
var AttackTopLeft: TextureButton
var AttackTopRight: TextureButton
var AttackBottomLeft: TextureButton
var AttackBottomRight: TextureButton
var selectedSprite: Sprite2D
var area2d: Area2D
var animate: AnimationPlayer
var DeSelect: Area2D
var KingSprite: Sprite2D
var isSelectedSpriteVisible: bool = false
var isKing: bool = false




func _ready():
	highlightedSprite = $HighlightedSprite2D
	selectedSprite = $SelectedSprite2D
	animate = $AnimationPlayer
	TopLeft = $TextureButtonTL
	TopRight = $TextureButtonTR
	BottomLeft = $TextureButtonBL
	BottomRight = $TextureButtonBR
	AttackTopLeft = $TextureButtonATL
	AttackTopRight = $TextureButtonATR
	AttackBottomLeft = $TextureButtonABL
	AttackBottomRight = $TextureButtonABR
	DeSelect = $DeSelect
	KingSprite = $KingSprite
	

	
	

func _physics_process(_delta):
	if position.y == 56:
		isKing = true
		KingSprite.show()


func _on_button_checker_pressed():
	if isSelectedSpriteVisible == true and !Global.selected and Global.redTurn:
		animate.play("Selected")
		DeSelect.show()
		is_selected()

func _on_button_checker_mouse_entered():
	isSelectedSpriteVisible = true
	highlightedSprite.show()
func _on_button_checker_mouse_exited():
	isSelectedSpriteVisible = false
	highlightedSprite.hide()


func stop_selection():
	Global.selected = false
	isSelectedSpriteVisible = true

	TopLeft.hide()
	TopRight.hide()
	BottomRight.hide()
	BottomLeft.hide()
	selectedSprite.hide()
	AttackTopLeft.hide()
	AttackTopRight.hide()
	AttackBottomRight.hide()
	AttackBottomLeft.hide()

func is_selected():
	
	Global.selected = true
	#Global.printRedCheckers()
	var isTRfree = isFree("TR")
	var isTLfree = isFree("TL")
	var isBRfree = isFree("BR")
	var isBLfree = isFree("BL")


	#no restrictions
	selectedSprite.show()
	BottomLeft.show()
	BottomRight.show()
	if isKing:
		TopRight.show()
		TopLeft.show()
	#TopLeft restriction
	if (position.x - 1 < -56 or position.y - 1 < -56) or !isTLfree:
		TopLeft.hide()
		isTLfree = true
	if !(position.x - 17 < -56 or position.y - 17 < -56) and canAttack("TL"):
		AttackTopLeft.show()
	#TopRight restriction
	if (position.x + 1 > 56 or position.y - 1 < -56) or !isTRfree:
		TopRight.hide()
		isTRfree = true
	if !(position.x + 17 > 56 or position.y - 17 < -56) and canAttack("TR"):
		AttackTopRight.show()
	#BottomLeft restriction
	if (position.y + 1 > 56 or position.x - 1 < -56) or !isBLfree:
		BottomLeft.hide()
		isBLfree = true
	if !(position.y + 17 > 56 or position.x - 17 < -56) and canAttack("BL") and isKing:
		AttackBottomLeft.show()
	#BottomRight restriction
	if (position.y + 1 > 56 or position.x + 1 > 56) or !isBRfree:
		BottomRight.hide()
		isBRfree = true
	if !(position.y + 17 > 56 or position.x + 17 > 56) and canAttack("BR") and isKing:
		AttackBottomRight.show()



#Top Right Move
func _on_texture_button_tr_pressed():
	if TopRight.is_visible_in_tree() == true:
		Global.getRedChecker(position)
		position.x = position.x + 16
		position.y = position.y - 16
		Global.updateRedChecker(position)
		stop_selection()
		Global.redTurn = false
		Global.blackTurn = true

#Bottom Left Move
func _on_texture_button_bl_pressed():
	if BottomLeft.is_visible_in_tree() == true:
		Global.getRedChecker(position)
		position.x = position.x - 16
		position.y = position.y + 16
		Global.updateRedChecker(position)
		stop_selection()
		Global.redTurn = false
		Global.blackTurn = true

#Top Left Move
func _on_texture_button_tl_pressed():
	if TopLeft.is_visible_in_tree() == true:
		Global.getRedChecker(position)
		position.x = position.x - 16
		position.y = position.y - 16
		Global.updateRedChecker(position)
		stop_selection()
		Global.redTurn = false
		Global.blackTurn = true

#Bottom Right Move
func _on_texture_button_br_pressed():
	if BottomRight.is_visible_in_tree() == true:
		Global.getRedChecker(position)
		position.x = position.x + 16
		position.y = position.y + 16
		Global.updateRedChecker(position)
		stop_selection()
		Global.blackTurn = false
		Global.redTurn = true

#Attack Top Right
func _on_texture_button_atr_pressed():
	if AttackTopRight.is_visible_in_tree() == true:
		Global.attacked(Vector2(position.x + 16, position.y - 16))
		Global.getBlackChecker(position)
		position.x = position.x + 32
		position.y = position.y - 32
		Global.updateBlackChecker(position)
		changeTurn()

#Attack Bottom Left
func _on_texture_button_abl_pressed():
	if AttackBottomLeft.is_visible_in_tree() == true:
		Global.attacked(Vector2(position.x - 16, position.y + 16))
		Global.getBlackChecker(position)
		position.x = position.x - 32
		position.y = position.y + 32
		Global.updateBlackChecker(position)
		changeTurn()

#Attack Top Left
func _on_texture_button_atl_pressed():
	if AttackTopLeft.is_visible_in_tree() == true:
		Global.attacked(Vector2(position.x - 16, position.y - 16))
		Global.getBlackChecker(position)
		position.x = position.x - 32
		position.y = position.y - 32
		Global.updateBlackChecker(position)
		changeTurn()



#deselect checker
func _on_de_select_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and isSelectedSpriteVisible == false:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			stop_selection()


func changeTurn():
	if (canAttack("TR") or canAttack("TL") or canAttack("BR") or canAttack("BL")):# and attacking:
		print("double")
		is_selected()
	stop_selection()
	Global.blackTurn = false
	Global.redTurn = true
	


func isFree(peek):
	var look
	if peek == "TR":
		look = Vector2(position.x + 16, position.y - 16)
	if peek == "TL":
		look = Vector2(position.x - 16, position.y - 16)
	if peek == "BR":
		look = Vector2(position.x + 16, position.y + 16)
	if peek == "BL":
		look = Vector2(position.x - 16, position.y + 16)

	if look.x == Global.bc1[0] and look.y == Global.bc1[1]:
		return false
	if look.x == Global.bc2[0] and look.y == Global.bc2[1]:
		return false
	if look.x == Global.bc3[0] and look.y == Global.bc3[1]:
		return false
	if look.x == Global.bc4[0] and look.y == Global.bc4[1]:
		return false
	if look.x == Global.bc5[0] and look.y == Global.bc5[1]:
		return false
	if look.x == Global.bc6[0] and look.y == Global.bc6[1]:
		return false
	if look.x == Global.bc7[0] and look.y == Global.bc7[1]:
		return false
	if look.x == Global.bc8[0] and look.y == Global.bc8[1]:
		return false
	if look.x == Global.bc9[0] and look.y == Global.bc9[1]:
		return false
	if look.x == Global.bc10[0] and look.y == Global.bc10[1]:
		return false
	if look.x == Global.bc11[0] and look.y == Global.bc11[1]:
		return false
	if look.x == Global.bc12[0] and look.y == Global.bc12[1]:
		return false
	
	if look.x == Global.rc1[0] and look.y == Global.rc1[1]:
		return false
	if look.x == Global.rc2[0] and look.y == Global.rc2[1]:
		return false
	if look.x == Global.rc3[0] and look.y == Global.rc3[1]:
		return false
	if look.x == Global.rc4[0] and look.y == Global.rc4[1]:
		return false
	if look.x == Global.rc5[0] and look.y == Global.rc5[1]:
		return false
	if look.x == Global.rc6[0] and look.y == Global.rc6[1]:
		return false
	if look.x == Global.rc7[0] and look.y == Global.rc7[1]:
		return false
	if look.x == Global.rc8[0] and look.y == Global.rc8[1]:
		return false
	if look.x == Global.rc9[0] and look.y == Global.rc9[1]:
		return false
	if look.x == Global.rc10[0] and look.y == Global.rc10[1]:
		return false
	if look.x == Global.rc11[0] and look.y == Global.rc11[1]:
		return false
	if look.x == Global.rc12[0] and look.y == Global.rc12[1]:
		return false
	else:
		return true


func canAttack(peek):
	var look
	var lookAhead
	if peek == "TR":
		look = Vector2(position.x + 16, position.y - 16)
		lookAhead = Vector2(position.x + 32, position.y - 32)
	if peek == "TL":
		look = Vector2(position.x - 16, position.y - 16)
		lookAhead = Vector2(position.x - 32, position.y - 32)
	if peek == "BR":
		look = Vector2(position.x + 16, position.y + 16)
		lookAhead = Vector2(position.x + 32, position.y + 32)
	if peek == "BL":
		look = Vector2(position.x - 16, position.y + 16)
		lookAhead = Vector2(position.x - 32, position.y + 32)
	
	if !isFree(peek):
		if (look.x == Global.rc1[0] and look.y == Global.rc1[1]) and !(lookAhead.x == Global.rc1[0] and lookAhead.y == Global.rc1[1]) and !(lookAhead.x == Global.bc1[0] and lookAhead.y == Global.bc1[1]):
			return true
		if (look.x == Global.rc2[0] and look.y == Global.rc2[1]) and !(lookAhead.x == Global.rc2[0] and lookAhead.y == Global.rc2[1]) and !(lookAhead.x == Global.bc2[0] and lookAhead.y == Global.bc2[1]):
			return true
		if (look.x == Global.rc3[0] and look.y == Global.rc3[1]) and !(lookAhead.x == Global.rc3[0] and lookAhead.y == Global.rc3[1]) and !(lookAhead.x == Global.bc3[0] and lookAhead.y == Global.bc3[1]):
			return true
		if (look.x == Global.rc4[0] and look.y == Global.rc4[1]) and !(lookAhead.x == Global.rc4[0] and lookAhead.y == Global.rc4[1]) and !(lookAhead.x == Global.bc4[0] and lookAhead.y == Global.bc4[1]):
			return true
		if (look.x == Global.rc5[0] and look.y == Global.rc5[1]) and !(lookAhead.x == Global.rc5[0] and lookAhead.y == Global.rc5[1]) and !(lookAhead.x == Global.bc5[0] and lookAhead.y == Global.bc5[1]):
			return true
		if (look.x == Global.rc6[0] and look.y == Global.rc6[1]) and !(lookAhead.x == Global.rc6[0] and lookAhead.y == Global.rc6[1]) and !(lookAhead.x == Global.bc6[0] and lookAhead.y == Global.bc6[1]):
			return true
		if (look.x == Global.rc7[0] and look.y == Global.rc7[1]) and !(lookAhead.x == Global.rc7[0] and lookAhead.y == Global.rc7[1]) and !(lookAhead.x == Global.bc7[0] and lookAhead.y == Global.bc7[1]):
			return true
		if (look.x == Global.rc8[0] and look.y == Global.rc8[1]) and !(lookAhead.x == Global.rc8[0] and lookAhead.y == Global.rc8[1]) and !(lookAhead.x == Global.bc8[0] and lookAhead.y == Global.bc8[1]):
			return true
		if (look.x == Global.rc9[0] and look.y == Global.rc9[1]) and !(lookAhead.x == Global.rc9[0] and lookAhead.y == Global.rc9[1]) and !(lookAhead.x == Global.bc9[0] and lookAhead.y == Global.bc9[1]):
			return true
		if (look.x == Global.rc10[0] and look.y == Global.rc10[1]) and !(lookAhead.x == Global.rc10[0] and lookAhead.y == Global.rc10[1]) and !(lookAhead.x == Global.bc10[0] and lookAhead.y == Global.bc10[1]):
			return true
		if (look.x == Global.rc11[0] and look.y == Global.rc11[1]) and !(lookAhead.x == Global.rc11[0] and lookAhead.y == Global.rc11[1]) and !(lookAhead.x == Global.bc11[0] and lookAhead.y == Global.bc11[1]):
			return true
		if (look.x == Global.rc12[0] and look.y == Global.rc12[1]) and !(lookAhead.x == Global.rc12[0] and lookAhead.y == Global.rc12[1]) and !(lookAhead.x == Global.bc12[0] and lookAhead.y == Global.bc12[1]):
			return true
		return false
	else:
		return false




