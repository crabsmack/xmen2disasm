; ---------------------------------------------------------------------------
; Pad_ConfigButtonMask - joypad mask for action N in the current control layout
; In:  8(a6) = word: action index 0-7
; Out: d0 = word: mask (sign-extended byte)
; Evidence: Tbl_ButtonConfigs[layout * 8 + action] with layout word -$38A6(a5); Game_Main (sub_005466) fills the byte array -$3A40 with it at TAS frame 4
; ---------------------------------------------------------------------------
Pad_ConfigButtonMask:
	link.w	a6,#$0
	lea.l	$5152(a5),a0
	move.w	$A(a6),d0
	ext.l	d0
	add.l	$2(a0),d0
	move.w	-$38A6(a5),d1
	ext.l	d1
	lsl.l	#$3,d1
	add.l	d0,d1
	movea.l	d1,a0
	move.b	(a0),d0
	ext.w	d0
	unlk	a6
	rts
