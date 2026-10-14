; ---------------------------------------------------------------------------
; sub_1FDC90	[jt 2591]
; ---------------------------------------------------------------------------
sub_1FDC90:
	link.w	a6,#$0
	move.b	#$1,-$3A08(a5)
	tst.b	-$3A0C(a5)
	bne.s	loc_1FDCC2
	move.b	#$1,-$3A0C(a5)
	jsr	sub_1FD8D2(pc)
	jsr	$4DEA(a5)	; -> sub_1F4EFC
	tst.b	-$1D4A(a5)
	beq.s	loc_1FDCC2
	clr.b	-$1D4A(a5)
	jsr	$51E2(a5)	; -> sub_1FE28C
	move.b	#$1,-$3A0A(a5)
loc_1FDCC2:
	jsr	$49DA(a5)	; -> sub_1E1928
	unlk	a6
	rts
