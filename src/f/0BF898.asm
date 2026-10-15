; ---------------------------------------------------------------------------
; SavageJungle_InitPalPhases - Savage jungle: read the palette-phase script from the map header (word at header +$12); start phase 0 if its first word is 1
; In:  none
; Out: none
; Evidence: -$3C1A = script + 2, -$3C1C/-$3C1E := 0, else none; TAS 29675
; Found: jt 1082
; ---------------------------------------------------------------------------
SavageJungle_InitPalPhases:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	-$CB2(a5),a0
	moveq	#$0,d0
	move.w	$12(a0),d0
	tst.l	d0
	movea.l	d0,a4
	adda.l	-$CB2(a5),a4
	movea.l	a4,a3
	addq.w	#$2,a3
	move.w	(a4),d7
	cmpi.w	#$1,d7
	beq.s	loc_0BF8C6
	moveq	#$0,d0
	move.l	d0,-$3C1A(a5)
	bra.s	loc_0BF8D2
loc_0BF8C6:
	move.l	a3,-$3C1A(a5)
	clr.w	-$3C1C(a5)
	clr.w	-$3C1E(a5)
loc_0BF8D2:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
