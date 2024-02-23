extends Node2D

var bc1: Node2D
var bc2: Node2D
var bc3: Node2D
var bc4: Node2D
var bc5: Node2D
var bc6: Node2D
var bc7: Node2D
var bc8: Node2D
var bc9: Node2D
var bc10: Node2D
var bc11: Node2D
var bc12: Node2D

var rc1: Node2D
var rc2: Node2D
var rc3: Node2D
var rc4: Node2D
var rc5: Node2D
var rc6: Node2D
var rc7: Node2D
var rc8: Node2D
var rc9: Node2D
var rc10: Node2D
var rc11: Node2D
var rc12: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	bc1 = $BlackChecker1
	bc2 = $BlackChecker2
	bc3 = $BlackChecker3
	bc4 = $BlackChecker4
	bc5 = $BlackChecker5
	bc6 = $BlackChecker6
	bc7 = $BlackChecker7
	bc8 = $BlackChecker8
	bc9 = $BlackChecker9
	bc10 = $BlackChecker10
	bc11 = $BlackChecker11
	bc12 = $BlackChecker12
	
	rc1 = $RedChecker1
	rc2 = $RedChecker2
	rc3 = $RedChecker3
	rc4 = $RedChecker4
	rc5 = $RedChecker5
	rc6 = $RedChecker6
	rc7 = $RedChecker7
	rc8 = $RedChecker8
	rc9 = $RedChecker9
	rc10 = $RedChecker10
	rc11 = $RedChecker11
	rc12 = $RedChecker12
	
	

func _physics_process(_delta):
	checkAlive()

func checkAlive():
	if Global.alive[0] == 0:
		bc1.hide()
	if Global.alive[1] == 0:
		bc2.hide()
	if Global.alive[2] == 0:
		bc3.hide()
	if Global.alive[3] == 0:
		bc4.hide()
	if Global.alive[4] == 0:
		bc5.hide()
	if Global.alive[5] == 0:
		bc6.hide()
	if Global.alive[6] == 0:
		bc7.hide()
	if Global.alive[7] == 0:
		bc8.hide()
	if Global.alive[8] == 0:
		bc9.hide()
	if Global.alive[9] == 0:
		bc10.hide()
	if Global.alive[10] == 0:
		bc11.hide()
	if Global.alive[11] == 0:
		bc12.hide()
	if Global.alive[12] == 0:
		rc1.hide()
	if Global.alive[13] == 0:
		rc2.hide()
	if Global.alive[14] == 0:
		rc3.hide()
	if Global.alive[15] == 0:
		rc4.hide()
	if Global.alive[16] == 0:
		rc5.hide()
	if Global.alive[17] == 0:
		rc6.hide()
	if Global.alive[18] == 0:
		rc7.hide()
	if Global.alive[19] == 0:
		rc8.hide()
	if Global.alive[20] == 0:
		rc9.hide()
	if Global.alive[21] == 0:
		rc10.hide()
	if Global.alive[22] == 0:
		rc11.hide()
	if Global.alive[23] == 0:
		rc12.hide()

