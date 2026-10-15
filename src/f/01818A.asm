; ---------------------------------------------------------------------------
; ShootAcolyte_Move - parent Move, then clamp x to the patrol limits +$AA..+$AE (stopping horizontal motion at a limit) (SHOOTACOLYTE override of slot +$4E Move)
; In:  8(a6) = this (SHOOTACOLYTE object), $E(a6) = word step count
; Out: none
; Evidence: class descriptor SHOOTACOLYTE slot +$4E (tools/classes.py); TAS frames 11790-12957 (586 active)
; ---------------------------------------------------------------------------
ShootAcolyte_Move:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	lea.l	$39A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	$AA(a4),d7
	bge.s	loc_0181D4
	move.w	$AA(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_0181EE
loc_0181D4:
	cmp.w	$AE(a4),d7
	ble.s	loc_0181EE
	move.w	$AE(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_0181EE:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
