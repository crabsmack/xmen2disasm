; ---------------------------------------------------------------------------
; loc_1430E4	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1430E4:
	move.w	#$1C,-$4(a6)
	move.w	#$FFE5,-$2(a6)
	move.w	#$290,d4
	move.w	#$FD70,d5
	moveq	#$A,d6
	moveq	#-$A,d7
	bra.w	loc_1431D6
loc_143100:
	move.w	#$22,-$4(a6)
	move.w	#$FFF9,-$2(a6)
	move.w	#$3A0,d4
	clr.w	d5
	moveq	#$E,d6
	clr.w	d7
	bra.w	loc_1431D6
loc_14311A:
	move.w	#$1B,-$4(a6)
	move.w	#$A,-$2(a6)
	move.w	#$290,d4
	move.w	#$290,d5
	moveq	#$A,d6
	moveq	#$A,d7
	bra.w	loc_1431D6
