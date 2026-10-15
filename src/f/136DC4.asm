; ---------------------------------------------------------------------------
; loc_136DC4	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_136DC4:
	move.w	#$180,$18(a4)
	ori.w	#$2,$A0(a4)
	lea.l	sub_1366A2(pc),a0
	move.l	a0,$94(a4)
	bra.s	loc_136E04
loc_136DDA:
	move.w	#$300,$18(a4)
	ori.w	#$2,$A0(a4)
	lea.l	sub_13695C(pc),a0
	move.l	a0,$94(a4)
	bra.s	loc_136E04
loc_136DF0:
	move.w	#$300,$18(a4)
	ori.w	#$2,$A0(a4)
	lea.l	sub_136B0E(pc),a0
	move.l	a0,$94(a4)
