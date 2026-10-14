; ---------------------------------------------------------------------------
; sub_0C0DC2	[jt 1116]
; ---------------------------------------------------------------------------
sub_0C0DC2:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$2372(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	ext.l	d0
	move.l	d0,d7
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	adda.w	d0,a0
	move.l	a0,-$3C0E(a5)
	move.w	$E(a6),-$3C10(a5)
	move.w	$12(a6),-$3C12(a5)
	clr.w	-$3C0A(a5)
	clr.w	-$3C08(a5)
	move.b	#$1,-$3C14(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
