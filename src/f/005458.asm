; ---------------------------------------------------------------------------
; unk_Boot_005458 - set word -$38A6 = 2 (row selector for the 8-byte table read by Pad_ConfigButtonMask)
; In:  none
; Out: none
; Evidence: jt 1, called once from boot loc_1F483E at TAS frame 3; -$38A6 is only read by Pad_ConfigButtonMask (row * 8 into table at jt $5152); meaning of the row unknown
; ---------------------------------------------------------------------------
unk_Boot_005458:
	link.w	a6,#$0
	move.w	#$2,-$38A6(a5)
	unlk	a6
	rts
