; ---------------------------------------------------------------------------
; loc_143152	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_143152:
	move.w	#$FFCE,-$4(a6)
	move.w	#$FFF9,-$2(a6)
	move.w	#$FC60,d4
	clr.w	d5
	moveq	#-$E,d6
	clr.w	d7
	bra.s	loc_1431D6
loc_14316A:
	move.w	#$FFD5,-$4(a6)
	move.w	#$A,-$2(a6)
	move.w	#$FD70,d4
	move.w	#$290,d5
	moveq	#-$A,d6
	moveq	#$A,d7
	bra.s	loc_1431D6
loc_143184:
	move.w	#$FFE5,-$4(a6)
	move.w	#$1B,-$2(a6)
	move.w	#$FD70,d4
	move.w	#$290,d5
	moveq	#-$A,d6
	moveq	#$A,d7
	bra.s	loc_1431D6
