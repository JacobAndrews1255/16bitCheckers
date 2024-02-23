extends Node

var blackTurn = true
var redTurn = false

var alive = [1,1,1,1,1,1,1,1,1,1,1,1 ,1,1,1,1,1,1,1,1,1,1,1,1]

var bc1 = [-56,56]
var bc2 = [-24,56]
var bc3 = [8,56]
var bc4 = [40,56]
var bc5 = [-40,40]
var bc6 = [-8,40]
var bc7 = [24,40]
var bc8 = [56,40]
var bc9 = [-56,24]
var bc10 = [-24,24]
var bc11 = [8,24]
var bc12 = [40,24]
var lastUsedBc = bc1

var rc1 = [-40,-56]
var rc2 = [-8,-56]
var rc3 = [24,-56]
var rc4 = [56,-56]
var rc5 = [-56,-40]
var rc6 = [-24,-40]
var rc7 = [8,-40]
var rc8 = [40,-40]
var rc9 = [-40,-24]
var rc10 = [-8,-24]
var rc11 = [24,-24]
var rc12 = [56,-24]
var lastUsedRc = rc1

var selected = false

func getBlackChecker(checkerPosition):
	if checkerPosition.x == bc1[0] and checkerPosition.y == bc1[1]:
		lastUsedBc = bc1
	if checkerPosition.x == bc2[0] and checkerPosition.y == bc2[1]:
		lastUsedBc = bc2
	if checkerPosition.x == bc3[0] and checkerPosition.y == bc3[1]:
		lastUsedBc = bc3
	if checkerPosition.x == bc4[0] and checkerPosition.y == bc4[1]:
		lastUsedBc = bc4
	if checkerPosition.x == bc5[0] and checkerPosition.y == bc5[1]:
		lastUsedBc = bc5
	if checkerPosition.x == bc6[0] and checkerPosition.y == bc6[1]:
		lastUsedBc = bc6
	if checkerPosition.x == bc7[0] and checkerPosition.y == bc7[1]:
		lastUsedBc = bc7
	if checkerPosition.x == bc8[0] and checkerPosition.y == bc8[1]:
		lastUsedBc = bc8
	if checkerPosition.x == bc9[0] and checkerPosition.y == bc9[1]:
		lastUsedBc = bc9
	if checkerPosition.x == bc10[0] and checkerPosition.y == bc10[1]:
		lastUsedBc = bc10
	if checkerPosition.x == bc11[0] and checkerPosition.y == bc11[1]:
		lastUsedBc = bc11
	if checkerPosition.x == bc12[0] and checkerPosition.y == bc12[1]:
		lastUsedBc = bc12

func getRedChecker(checkerPosition):
	if checkerPosition.x == rc1[0] and checkerPosition.y == rc1[1]:
		lastUsedRc = rc1
	if checkerPosition.x == rc2[0] and checkerPosition.y == rc2[1]:
		lastUsedRc = rc2
	if checkerPosition.x == rc3[0] and checkerPosition.y == rc3[1]:
		lastUsedRc = rc3
	if checkerPosition.x == rc4[0] and checkerPosition.y == rc4[1]:
		lastUsedRc = rc4
	if checkerPosition.x == rc5[0] and checkerPosition.y == rc5[1]:
		lastUsedRc = rc5
	if checkerPosition.x == rc6[0] and checkerPosition.y == rc6[1]:
		lastUsedRc = rc6
	if checkerPosition.x == rc7[0] and checkerPosition.y == rc7[1]:
		lastUsedRc = rc7
	if checkerPosition.x == rc8[0] and checkerPosition.y == rc8[1]:
		lastUsedRc = rc8
	if checkerPosition.x == rc9[0] and checkerPosition.y == rc9[1]:
		lastUsedRc = rc9
	if checkerPosition.x == rc10[0] and checkerPosition.y == rc10[1]:
		lastUsedRc = rc10
	if checkerPosition.x == rc11[0] and checkerPosition.y == rc11[1]:
		lastUsedRc = rc11
	if checkerPosition.x == rc12[0] and checkerPosition.y == rc12[1]:
		lastUsedRc = rc12

func updateBlackChecker(newPosition):
	lastUsedBc[0] = newPosition.x
	lastUsedBc[1] = newPosition.y

func updateRedChecker(newPosition):
	lastUsedRc[0] = newPosition.x
	lastUsedRc[1] = newPosition.y

func printBlackCheckers():
	print("bc1[",bc1[0],",",bc1[1],"]")
	print("bc2[",bc2[0],",",bc2[1],"]")
	print("bc3[",bc3[0],",",bc3[1],"]")
	print("bc4[",bc4[0],",",bc4[1],"]")
	print("bc5[",bc5[0],",",bc5[1],"]")
	print("bc6[",bc6[0],",",bc6[1],"]")
	print("bc7[",bc7[0],",",bc7[1],"]")
	print("bc8[",bc8[0],",",bc8[1],"]")
	print("bc9[",bc9[0],",",bc9[1],"]")
	print("bc10[",bc10[0],",",bc10[1],"]")
	print("bc11[",bc11[0],",",bc11[1],"]")
	print("bc12[",bc12[0],",",bc12[1],"]")

func attacked(checkerPosition):
	if checkerPosition.x == bc1[0] and checkerPosition.y == bc1[1]:
		alive[0] = 0
	if checkerPosition.x == bc2[0] and checkerPosition.y == bc2[1]:
		alive[1] = 0
	if checkerPosition.x == bc3[0] and checkerPosition.y == bc3[1]:
		alive[2] = 0
	if checkerPosition.x == bc4[0] and checkerPosition.y == bc4[1]:
		alive[3] = 0
	if checkerPosition.x == bc5[0] and checkerPosition.y == bc5[1]:
		alive[4] = 0
	if checkerPosition.x == bc6[0] and checkerPosition.y == bc6[1]:
		alive[5] = 0
	if checkerPosition.x == bc7[0] and checkerPosition.y == bc7[1]:
		alive[6] = 0
	if checkerPosition.x == bc8[0] and checkerPosition.y == bc8[1]:
		alive[7] = 0
	if checkerPosition.x == bc9[0] and checkerPosition.y == bc9[1]:
		alive[8] = 0
	if checkerPosition.x == bc10[0] and checkerPosition.y == bc10[1]:
		alive[9] = 0
	if checkerPosition.x == bc11[0] and checkerPosition.y == bc11[1]:
		alive[10] = 0
	if checkerPosition.x == bc12[0] and checkerPosition.y == bc12[1]:
		alive[11] = 0
	if checkerPosition.x == rc1[0] and checkerPosition.y == rc1[1]:
		alive[12] = 0
	if checkerPosition.x == rc2[0] and checkerPosition.y == rc2[1]:
		alive[13] = 0
	if checkerPosition.x == rc3[0] and checkerPosition.y == rc3[1]:
		alive[14] = 0
	if checkerPosition.x == rc4[0] and checkerPosition.y == rc4[1]:
		alive[15] = 0
	if checkerPosition.x == rc5[0] and checkerPosition.y == rc5[1]:
		alive[16] = 0
	if checkerPosition.x == rc6[0] and checkerPosition.y == rc6[1]:
		alive[17] = 0
	if checkerPosition.x == rc7[0] and checkerPosition.y == rc7[1]:
		alive[18] = 0
	if checkerPosition.x == rc8[0] and checkerPosition.y == rc8[1]:
		alive[19] = 0
	if checkerPosition.x == rc9[0] and checkerPosition.y == rc9[1]:
		alive[20] = 0
	if checkerPosition.x == rc10[0] and checkerPosition.y == rc10[1]:
		alive[21] = 0
	if checkerPosition.x == rc11[0] and checkerPosition.y == rc11[1]:
		alive[22] = 0
	if checkerPosition.x == rc12[0] and checkerPosition.y == rc12[1]:
		alive[23] = 0

