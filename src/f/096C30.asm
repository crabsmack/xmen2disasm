; ---------------------------------------------------------------------------
; XClone_StateChildAim - XCLONE state: child velocity = (target - position) * (1/8 - 1/32), flag +$98 bit $400
; In:  8(a6) = this
; Out: d0
; Evidence: next XClone_StateChildHome
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StateChildAim:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$9C(a3),a4
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d6
	sub.l	$8(a4),d6
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$C(a4),d7
	move.l	d6,d0
	asr.l	#$3,d0
	move.l	d6,d1
	asr.l	#$5,d1
	sub.w	d1,d0
	move.w	d0,$16(a4)
	move.l	d7,d0
	asr.l	#$3,d0
	move.l	d7,d1
	asr.l	#$5,d1
	sub.w	d1,d0
	move.w	d0,$18(a4)
	ori.w	#$400,$98(a4)
	clr.w	$6C(a3)
	lea.l	XClone_StateChildHome(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
